package web.route;

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
 * 跳转编辑商品信息
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/ToEditorProductServlet")
public class ToEditorProductServlet extends HttpServlet {
    ProductService productService=new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int pid = Integer.parseInt(id);
        Product product = productService.queryProductById(pid);
        request.setAttribute("product",product);
        request.getRequestDispatcher("WEB-INF/views/product/editProduct.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }
}
