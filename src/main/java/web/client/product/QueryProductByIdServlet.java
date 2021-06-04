package web.client.product;

import pojo.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/22
 */
@WebServlet("/QueryProductByIdServlet")
public class QueryProductByIdServlet extends HttpServlet {

    private ProductService productService=new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int pid = Integer.parseInt(id);
        Product product = productService.queryProductById(pid);
        request.setAttribute("p",product);
        request.getRequestDispatcher("WEB-INF/views/client/productInfo.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }
}
