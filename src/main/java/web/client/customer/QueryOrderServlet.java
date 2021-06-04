package web.client.customer;

import pojo.Order;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 根据用户id查询所有的订单
 * @author wyx
 * @version 1.0
 * @date 2020/11/26
 */
@WebServlet("/QueryOrderServlet")
public class QueryOrderServlet extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int uid = Integer.parseInt(id);
        List<Order> orders = orderService.queryOrderByUserId(uid);
        request.setAttribute("orders",orders);
        request.getRequestDispatcher("WEB-INF/views/client/customer/orderList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
