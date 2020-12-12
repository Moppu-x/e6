package org.zuel.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    //重写doGet方法;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //设置响应的内容类型及编码;
        response.setContentType("text/html;charset=UTF-8");
        //获取响应输出流;
        PrintWriter pWriter = response.getWriter();
        //响应内容;
        pWriter.write("<html>");
        pWriter.write("<head>");
        pWriter.write("<title>Welcome</title>");
        pWriter.write("</head>");
        pWriter.write("<body>");
        pWriter.write("<h1>This is Moppu!</h1>");
        pWriter.write("<hr />");
        pWriter.write("<p>My name is Moppu, I am a polar bear cub.</p>");
        pWriter.write("</body>");
        pWriter.write("</html>");
        pWriter.close();
    }
}
