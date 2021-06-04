package web.client.cart;

import pojo.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

/**
 * 改变购物车中的商品
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/ChangeCartServlet")
public class ChangeCartServlet extends HttpServlet {

    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String count1 = request.getParameter("count");
        int count = Integer.parseInt(count1);

        //从session中获取购物车
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Product product = productService.queryProductById(Integer.parseInt(id));

        if (count!=0) {
            cart.put(product,count);
        } else {
            Iterator<Product> iterator = cart.keySet().iterator();
            while (iterator.hasNext()){
                Product p = iterator.next();
                if (p.getId().equals(id)){
                    iterator.remove();
                }
            }
        }
        request.getRequestDispatcher("WEB-INF/views/client/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
