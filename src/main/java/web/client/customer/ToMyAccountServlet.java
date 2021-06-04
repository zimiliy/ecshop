package web.client.customer;

import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 跳转到我的账户
 * @author wyx
 * @version 1.0
 * @date 2020/11/26
 */
@WebServlet("/ToMyAccountServlet")
public class ToMyAccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("user");
        session.setAttribute("user",user);
        if (user==null){
            request.setAttribute("msg","用户未登录");
            request.getRequestDispatcher("WEB-INF/views/main/login.jsp").forward(request,response);
        }else {
            request.getRequestDispatcher("WEB-INF/views/client/customer/myAccount.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
