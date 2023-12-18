package com.study;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyTestMethod {

    public static void main(String[] args)  throws  Exception{
        try{
            Connection conn= DriverManager.getConnection("");
        }catch (SQLException e){
            // DB 관련  연결 or 쿼리 실행 등 에러가  나면
            // 실제로 에러를 발생시켜야 합니다.
            // 쿼리 중에 더 정확한 exception을 발생시켜야합니다. RuntimException으로

        }
    }
}
