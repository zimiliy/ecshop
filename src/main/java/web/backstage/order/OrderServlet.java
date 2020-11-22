package web.backstage.order;

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
 * 订单列表
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Order> orders = orderService.queryAllOrder();
        request.setAttribute("orders",orders);
        request.getRequestDispatcher("WEB-INF/views/order/orderList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doGet(req, resp);
    }
}
