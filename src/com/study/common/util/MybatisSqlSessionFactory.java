package com.study.common.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class MybatisSqlSessionFactory {
    private static SqlSessionFactory sqlSessionFactory;
    static {
        try{
        String resource = "mybatis/mybatis-config.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        System.out.println("SqlSessionFactory 초기화 성공");
        }catch ( Exception e){
            e.printStackTrace();
        }
    }


    public  static SqlSessionFactory getSqlSessionFactory(){
        return sqlSessionFactory;
    }


}
