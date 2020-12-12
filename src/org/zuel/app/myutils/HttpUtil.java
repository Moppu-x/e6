package org.zuel.app.myutils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;

public class HttpUtil {
    //get方法实现http请求
    public static String get(String address,String param) throws IOException {
        //返回的结果result
        String result = "";
        StringBuilder builder = new StringBuilder();
        //请求地址request
        String request = address + "?" + param;
        try {
            //根据请求地址创建一个URL对象
            URL url = new URL(request);
            //使用URLConnection获取资源
            URLConnection conn = url.openConnection();
            //设置http请求头的部分属性
            conn.setRequestProperty("Accept", "*/*");
            conn.setRequestProperty("Connection", "keep-alive");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:82.0)");
            //建立连接
            conn.connect();
            //获取输入流
            InputStreamReader in = new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8);
            BufferedReader reader = new BufferedReader(in);
            //读取响应内容
            String line = reader.readLine();
            while(line != null) {
                builder.append(line);
                line = reader.readLine();
            }
            result = builder.toString();
            //关闭输入流
            reader.close();
            in.close();
        } catch (MalformedURLException e) {
            System.out.println("Something wrong with the URL.");
            e.printStackTrace();
        }
        return result;
    }
}
