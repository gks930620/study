package com.study.free.dao;

import com.study.exception.DaoException;
import com.study.free.vo.FreeBoardVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FreeBoardDaoOracle implements IFreeBoardDao {
    @Override
    public List<FreeBoardVO> getBoardList() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer sb = new StringBuffer();
            sb.append(" SELECT                                                              ");
            sb.append("     bo_no          , bo_title      , bo_category          ,         ");
            sb.append("     bo_writer      , bo_pass       , bo_content           ,         ");
            sb.append("     bo_hit         ,                                                ");
            sb.append("                                                                     ");
            sb.append("     to_char(bo_reg_date, 'YYYY-MM-DD') AS bo_reg_date     ,         ");
            sb.append("     to_char(bo_mod_date, 'YYYY-MM-DD') AS bo_mod_date     ,         ");
            sb.append("                                                                     ");
            sb.append("     bo_del_yn                                                       ");
            sb.append(" FROM                                                                ");
            sb.append("     free_board                                                      ");
            sb.append("                                                                     ");

            pstmt = conn.prepareStatement(sb.toString());
            rs = pstmt.executeQuery();

            List<FreeBoardVO> freeBoardList = new ArrayList<>();
            while (rs.next()) {
                FreeBoardVO freeBoard = new FreeBoardVO();
                freeBoard.setBoNo(rs.getInt("bo_no"));
                freeBoard.setBoTitle(rs.getString("bo_title"));
                freeBoard.setBoCategory(rs.getString("bo_category"));
                freeBoard.setBoWriter(rs.getString("bo_writer"));
                freeBoard.setBoPass(rs.getString("bo_pass"));
                freeBoard.setBoContent(rs.getString("bo_content"));
                freeBoard.setBoHit(rs.getInt("bo_hit"));
                freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
                freeBoard.setBoModDate(rs.getString("bo_mod_date"));
                freeBoard.setBoDelYn(rs.getString("bo_del_yn"));
                freeBoardList.add(freeBoard);
            }

            return  freeBoardList;

        } catch (SQLException e) {
            throw  new DaoException("freeBoardList에서 에러났다.",e);
        } finally {
            if (conn != null)  try{conn.close(); }   catch (SQLException e){};
            if (pstmt != null) try{pstmt.close(); }   catch (SQLException e){};
            if (rs != null)    try{rs.close(); }   catch (SQLException e){};
        }
    }

    @Override
    public FreeBoardVO getBoard(int boNo) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer sb = new StringBuffer();
            sb.append(" SELECT                                                              ");
            sb.append("     bo_no          , bo_title      , bo_category          ,         ");
            sb.append("     bo_writer      , bo_pass       , bo_content           ,         ");
            sb.append("     bo_hit         ,                                                ");
            sb.append("                                                                     ");
            sb.append("     to_char(bo_reg_date, 'YYYY-MM-DD') AS bo_reg_date     ,         ");
            sb.append("     to_char(bo_mod_date, 'YYYY-MM-DD') AS bo_mod_date     ,         ");
            sb.append("                                                                     ");
            sb.append("     bo_del_yn                                                       ");
            sb.append(" FROM                                                                ");
            sb.append("     free_board                                                      ");
            sb.append(" WHERE bo_no=?                                                       ");

            pstmt = conn.prepareStatement(sb.toString());

            pstmt.setInt(1,boNo);

            rs = pstmt.executeQuery();
            if(rs.next()) {
                FreeBoardVO freeBoard = new FreeBoardVO();
                freeBoard.setBoNo(rs.getInt("bo_no"));
                freeBoard.setBoTitle(rs.getString("bo_title"));
                freeBoard.setBoCategory(rs.getString("bo_category"));
                freeBoard.setBoWriter(rs.getString("bo_writer"));
                freeBoard.setBoPass(rs.getString("bo_pass"));
                freeBoard.setBoContent(rs.getString("bo_content"));
                freeBoard.setBoHit(rs.getInt("bo_hit"));
                freeBoard.setBoRegDate(rs.getString("bo_reg_date"));
                freeBoard.setBoModDate(rs.getString("bo_mod_date"));
                freeBoard.setBoDelYn(rs.getString("bo_del_yn"));
               return  freeBoard;
            }
            return  null;  // int boNo도 잘 왔고, 쿼리도 문제없는데, DB에 boNo에 해당하는 글이 없을 때..
        } catch (SQLException e) {
            throw new DaoException("free의 getBoard 실행중 에러 ",e);
        }finally {
            if (conn != null)  try{conn.close(); }   catch (SQLException e){};
            if (pstmt != null) try{pstmt.close(); }   catch (SQLException e){};
            if (rs != null)    try{rs.close(); }   catch (SQLException e){};
        }

    }

    @Override
    public int increaseHit(int boNo) {
        return 0;
    }

    @Override
    public int updateBoard(FreeBoardVO freeBoard) {
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try{
            conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer sb=new StringBuffer();
            sb.append(" UPDATE free_board SET               ");
            sb.append(" bo_title=?             ,            ");
            sb.append(" bo_category=?          ,            ");
            sb.append(" bo_content=?           ,            ");
            sb.append(" bo_mod_date=sysdate                 ");
            sb.append(" WHERE bo_no= ?                      ");
            pstmt=conn.prepareStatement(sb.toString());
            int index=1;
            pstmt.setString(index++ , freeBoard.getBoTitle());
            pstmt.setString(index++ , freeBoard.getBoCategory());
            pstmt.setString(index++ , freeBoard.getBoContent());
            pstmt.setInt(index++ , freeBoard.getBoNo());

            int row = pstmt.executeUpdate();
            return  row;
        }catch (SQLException e){
            throw new DaoException("free update 도중 에러 ",e);
        }finally {
            if (conn != null)  try{conn.close(); }   catch (SQLException e){};
            if (pstmt != null) try{pstmt.close(); }   catch (SQLException e){};
            if (rs != null)    try{rs.close(); }   catch (SQLException e){};
        }
    }

    @Override
    public int deleteBoard(FreeBoardVO freeBoard) {
        Connection conn=null;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        try{
            conn=DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer sb=new StringBuffer();
            sb.append(" UPDATE free_board SET               ");
            sb.append(" bo_del_yn='Y'                       ");
            sb.append(" WHERE bo_no= ?                      ");

            pstmt=conn.prepareStatement(sb.toString());
            pstmt.setInt(1 , freeBoard.getBoNo());
            int row = pstmt.executeUpdate();
            return  row;

        }catch (SQLException e){
            throw  new DaoException("free delete 도중 에러 " ,e);
        }finally {
            if (conn != null)  try{conn.close(); }   catch (SQLException e){};
            if (pstmt != null) try{pstmt.close(); }   catch (SQLException e){};
            if (rs != null)    try{rs.close(); }   catch (SQLException e){};
        }
    }

    @Override
    public int insertBoard(FreeBoardVO freeBoard) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:study");
            StringBuffer sb = new StringBuffer();
            sb.append("   INSERT INTO free_board (                                                   ");
            sb.append("       bo_no                         , bo_title    , bo_category       ,      ");
            sb.append("       bo_writer                     , bo_pass     , bo_content        ,      ");
            sb.append("       bo_hit                        ,                                        ");
            sb.append("       bo_reg_date                   ,                                        ");
            sb.append("       bo_mod_date                   ,                                        ");
            sb.append("       bo_del_yn                                                              ");
            sb.append("   ) VALUES (                                                                 ");
            sb.append("       seq_free_board.nextval         , ?           , ?                 ,     ");
            sb.append("       ?                              , ?           , ?                 ,     ");
            sb.append("       0                              ,                                       ");
            sb.append("       sysdate                        ,                                       ");
            sb.append("       null                           ,                                       ");
            sb.append("       'N'                                                                    ");
            sb.append("  )                                                                           ");
            pstmt = conn.prepareStatement(sb.toString());

            int index=1;
            pstmt.setString(index++, freeBoard.getBoTitle() );
            pstmt.setString(index++, freeBoard.getBoCategory() );
            pstmt.setString(index++, freeBoard.getBoWriter() );
            pstmt.setString(index++, freeBoard.getBoPass() );
            pstmt.setString(index++, freeBoard.getBoContent() );
            int row=pstmt.executeUpdate();
            return  row;
        } catch (SQLException e) {
            throw  new DaoException("free insert 도중 에러" , e);
        } finally {
            if (conn != null)  try{conn.close(); }   catch (SQLException e){};
            if (pstmt != null) try{pstmt.close(); }   catch (SQLException e){};
            if (rs != null)    try{rs.close(); }   catch (SQLException e){};
        }
    }
}
