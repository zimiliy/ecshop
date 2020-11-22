package web.backstage.order;

import service.OrderService;
import service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 删除订单
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/DeleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int oid = Integer.parseInt(id);
        int i = orderService.deleteOrderById(oid);
        if (i>0){
            /**
             * 删除成功之后，重定向回到订单列表请求
             */
            response.sendRedirect("OrderServlet");
        }else {
            System.out.println("删除失败");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
