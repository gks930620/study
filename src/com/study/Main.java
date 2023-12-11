package com.study;

import com.study.login.vo.UserVO;

public class Main {

    public static void main(String[] args) {
        UserVO user = new UserVO();
        //user.setUserId(null);
        //user.setUserId("      ");
        if(user.getUserId()==null || user.getUserId().isBlank()){

        }
        if(user.getUserId().isBlank()||user.getUserId()==null){

        }

    }

}
