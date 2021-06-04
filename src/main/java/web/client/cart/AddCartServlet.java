package web.client.cart;

import pojo.Product;
import pojo.User;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 加入购物车
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            // 1.得到商品id
            String id = request.getParameter("id");
            int pid = Integer.parseInt(id);
            // 2.调用service层方法，根据id查找商品
            ProductService productService = new ProductServiceImpl();
            try {
                Product p = productService.queryProductById(pid);
                //将商品添加到购物车
                //获得session对象
                HttpSession session = request.getSession();
                //从session中获取购物车对象
                Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
                //如果购物车为null,说明没有商品存储在购物车中，创建出购物车
                if (cart == null) {
                    cart = new HashMap<Product, Integer>();
                }
                //向购物车中添加商品
                Integer count = cart.put(p, 1);
                //如果商品数量不为空，则商品数量+1，否则添加新的商品信息
                if (count != null) {
                    cart.put(p, count + 1);
                }
                session.setAttribute("cart", cart);
                request.getRequestDispatcher("WEB-INF/views/client/cart.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else {
            request.setAttribute("msg","用户未登录");
            request.getRequestDispatcher("WEB-INF/views/main/login.jsp").forward(request,response);
        }
    }
}
