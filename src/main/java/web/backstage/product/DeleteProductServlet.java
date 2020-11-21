package web.backstage.product;

import service.ProductService;
import service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 根据商品id删除商品信息
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {

    ProductService productService=new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        int pid = Integer.parseInt(id);

        int i = productService.deleteProductById(pid);
        if (i>0){
            /**
             * 删除成功之后，重定向回到商品列表请求
              */
          response.sendRedirect("ProductServlet");
        }else {
            System.out.println("删除失败");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request,response);
    }
}
