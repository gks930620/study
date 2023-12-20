package com.study;

public class Main {

    public static void main(String[] args) {
        String[] arr={"a","b","c"};
        jumjumjum("a", "b" , "c");
        jumjumjum(arr);
    }

    public static String jumjumjum(String... strs){
        StringBuffer sb=new StringBuffer(); //strs는 배열
        for(String str : strs){
            sb.append(str);
        }
        return sb.toString();
    }
}
