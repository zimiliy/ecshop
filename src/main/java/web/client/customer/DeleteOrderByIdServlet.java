package web.client.customer;

import pojo.User;
import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 客户端根据订单id删除订单信息
 * @author wyx
 * @version 1.0
 * @date 2020/11/27
 */
@WebServlet("/DeleteOrderByIdServlet")
public class DeleteOrderByIdServlet extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int oid = Integer.parseInt(id);
        orderService.deleteOrderById(oid);
        User user = (User) request.getSession().getAttribute("user");
        request.getRequestDispatcher("QueryOrderServlet?id="+user.getUid()).forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
