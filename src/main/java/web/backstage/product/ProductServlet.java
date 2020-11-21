package web.backstage.product;

import pojo.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 商品跳转
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {

    ProductService productService=new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /**
         * 查询全部信息
         */
        List<Product> products = productService.queryAllProduct();
        request.setAttribute("allProduct",products);
        request.getRequestDispatcher("WEB-INF/views/product/productList.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
