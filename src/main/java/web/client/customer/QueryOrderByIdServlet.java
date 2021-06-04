package web.client.customer;

import pojo.Order;
import service.OrderService;
import service.ProductService;
import service.impl.OrderServiceImpl;
import service.impl.ProductServiceImpl;
import utils.OrderUtils;
import vo.ProductVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 顾客根据订单编号查询订单详情
 * @author wyx
 * @version 1.0
 * @date 2020/11/26
 */
@WebServlet("/QueryOrderByIdServlet")
public class QueryOrderByIdServlet  extends HttpServlet {
    private ProductService productService=new ProductServiceImpl();

    private OrderService orderService=new OrderServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int oid = Integer.parseInt(id);

        //查询订单
        Order order = orderService.findOrderById(oid);

        //根据订单id查询对应的商品列表
        List<ProductVo> productVos = OrderUtils.orderById(productService, oid);
        request.setAttribute("order",order);

        request.setAttribute("productByOrder",productVos);

        request.getRequestDispatcher("WEB-INF/views/client/customer/orderInfo.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
