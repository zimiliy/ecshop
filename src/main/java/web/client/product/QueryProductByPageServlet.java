package web.client.product;

import service.ProductService;
import service.impl.ProductServiceImpl;
import utils.PageUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 分页查询商品信息
 *
 * @author wyx
 * @version 1.0
 * @date 2020/11/30
 */
@WebServlet("/QueryProductByPageServlet")
public class QueryProductByPageServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        //定义当前页码，默认为1
        int currentPage = 1;
        String _currentPage = request.getParameter("currentPage");
        if (_currentPage != null) {
            currentPage = Integer.parseInt(_currentPage);
        }
        //定义每页显示条数,默认为5
        int currentCount = 5;
        String _currentCount = request.getParameter("currentCount");
        if (_currentCount != null) {
            currentCount = Integer.parseInt(_currentCount);
        }
        String category = "全部商品";
        String type = request.getParameter("category");
        if (type != null) {
            category = type;
        }

        PageUtils pageProduct = productService.queryProductByPage(currentPage, currentCount, category);
        request.setAttribute("pageProduct", pageProduct);

        request.getRequestDispatcher("WEB-INF/views/client/product/productList.jsp").forward(request, response);
    }
}
