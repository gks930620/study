package com.study;

import com.study.free.vo.FreeBoardVO;

import java.sql.*;

public class DBTimeMain {
    public static void main(String[] args)   throws SQLException{
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        int boNo = 5;

        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@nextit.or.kr:1521:xe", "java", "oracle21c");
        PreparedStatement pstmt= conn.prepareStatement(" SELECT * FROM free_board WHERE bo_no=? ");
        pstmt.setInt(1,boNo);
        ResultSet rs= pstmt.executeQuery();
        try(conn ; pstmt ; rs ; ){
            if(rs.next()){
                FreeBoardVO freeBoard=new FreeBoardVO();
                freeBoard.setBoNo( rs.getInt("bo_no") );
                freeBoard.setBoCategory(  rs.getString("bo_category"));
                freeBoard.setBoContent(  rs.getString("bo_content"));
                freeBoard.setBoWriter(  rs.getString("bo_writer"));
                freeBoard.setBoPass(  rs.getString("bo_pass"));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

    }
}
