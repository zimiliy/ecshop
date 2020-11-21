package web.backstage.product;

import org.apache.commons.beanutils.BeanUtils;
import pojo.Product;
import service.ProductService;
import service.impl.ProductServiceImpl;
import utils.UploadUntils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * 添加商品servlet
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {

    ProductService productService=new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //用于封装商品对象
        Product product=new Product();
        Map map = UploadUntils.upload(request, product, this);

        try {
            // 将数据封装到javaBean中
            BeanUtils.populate(product, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        try {
            // 调用service完成添加商品操作
            productService.addProduct(product);
            response.sendRedirect("ProductServlet");
            return;
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("添加商品失败");
            return;
        }


    }
}
