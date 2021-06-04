package web.client.cart;

import org.apache.commons.beanutils.BeanUtils;
import pojo.Order;
import pojo.Product;
import pojo.User;
import service.OrderService;
import service.impl.OrderServiceImpl;
import utils.OrderUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 添加订单
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        //获取商品的商量
        String buynum = request.getParameter("text");
        int count = Integer.parseInt(buynum);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Order order = new Order();
        try {
            BeanUtils.populate(order, request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //随机生成订单编号
        int oid = OrderUtils.getNumber();
        order.setId(oid);

        //遍历购物车，取出商品编号
        for (Product p : cart.keySet()) {
            int pid = Integer.parseInt(p.getId());
            orderService.addProductOrder(pid, oid, count);
        }
        order.setUserid(user.getUid());
        order.setOrdertime(OrderUtils.zoneToLocalTimeStr());

        order.setPaystate(1);

        int i = orderService.addOrder(order);

        request.getRequestDispatcher("WEB-INF/views/client/paySuccess.jsp").forward(request,response);

    }
}
