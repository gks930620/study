package com.study.servlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

//Spring에서 실제로 FrontServlet의 역할을 하는 클래스가 DispatcherServlet이라 그냥 똑같이 만들어봤어요

@WebServlet(urlPatterns = {"*.wow"}, loadOnStartup = 1)
public class DispatcherServlet  extends HttpServlet {
    private  RequestMappingHandlerMapping handlerMapping;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void init() throws ServletException { //서버실행시 Servlet생성 후 실행되는 메소드
        try {
            handlerMapping=new RequestMappingHandlerMapping(getServletContext(),
                    "/WEB-INF/config/uri_handlermapping.properties" );
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //req.setCharacterEncoding("utf-8");
        String uri = req.getRequestURI();
        Handler handler = handlerMapping.getHandler(uri);

        if(handler==null){   //free/**.wow만 처리하는데 그게 아닌거지..
            resp.sendError(HttpServletResponse.SC_NOT_FOUND,"그 url은 처리할 수 없습니다.");
            return;
        }



        try{
            String viewPage = handler.process(req, resp);  //구현체들 전부 req 타입 바꿔주세요
            // /WEB-INF/views   .jsp는 공통
            if(viewPage.startsWith("redirect:")){
                viewPage=viewPage.substring("redirect:".length());
                resp.sendRedirect(viewPage);
                return;
            }
            viewPage= "/WEB-INF/views/" + viewPage + ".jsp";
            RequestDispatcher requestDispatcher = req.getRequestDispatcher(viewPage);
            requestDispatcher.forward(req,resp);
        }catch (Exception e){
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  //500
            e.printStackTrace();
        }


    }
}
