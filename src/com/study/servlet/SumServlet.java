package com.study.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;



public class SumServlet   extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html><body> <ul> ");
        int sum=0;
        for(int i=1 ; i<=10 ; i++){
            sum+=i;
            out.println("<li>1부터" + i + "까지 합 : "+sum + "</li>" );
        }
        out.println("</ul></body></html>");


    }

}
