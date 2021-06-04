package web.client.customer;

import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 跳转修改顾客信息
 * @author wyx
 * @version 1.0
 * @date 2020/11/26
 */
@WebServlet("/ToEditorCustomerServlet")
public class ToEditorCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        request.getSession().setAttribute("user",user);
        request.getRequestDispatcher("WEB-INF/views/client/customer/editorCustomerInfo.jsp").forward(request,response);
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
