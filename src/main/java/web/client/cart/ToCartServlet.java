package web.client.cart;

import pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author wyx
 * @version 1.0
 * @date 2020/12/1
 * <p>
 * 登录之后查看购物车
 */
@WebServlet("/ToCartServlet")
public class ToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从session中获取用户
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            request.setAttribute("cart", request.getSession().getAttribute("cart"));
            request.getRequestDispatcher("WEB-INF/views/client/cart.jsp").forward(request, response);
        }else {
            request.setAttribute("msg","用户未登录");
            request.getRequestDispatcher("WEB-INF/views/main/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
