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
 * 订单的条件查询
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/FindOrderServlet")
public class FindOrderServlet extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        System.out.println(id);
        String receiverName = request.getParameter("receiverName");

        List<Order> orders = orderService.queryOrder(id, receiverName);

        request.setAttribute("orders",orders);

        request.getRequestDispatcher("WEB-INF/views/order/orderList.jsp").forward(request,response);

    }
}
