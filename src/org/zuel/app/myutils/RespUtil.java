package org.zuel.app.myutils;

import java.util.HashMap;
import java.util.Map;

public class RespUtil {

    //请求失败时的响应
    public static Object fail(String msg) {
        Map<String,Object> fMap = new HashMap<>();
        fMap.put("code", 2);        //错误代码为2
        fMap.put("msg", msg);       //错误信息为参数msg
        return fMap;
    }

    //请求成功时的响应
    public static Object success(Object data) {
        Map<String,Object> sMap = new HashMap<>();
        sMap.put("code", 1);                     //成功的代码为1
        sMap.put("data", data);                  //响应的数据
        sMap.put("msg", "Successful request.");  //信息
        return sMap;
    }
    
}
