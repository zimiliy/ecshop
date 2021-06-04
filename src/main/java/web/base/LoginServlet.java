package web.base;

import org.apache.commons.lang.StringUtils;
import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录servlet
 * @author wyx
 * @version 1.0
 * @date 2020/11/9
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       request.setCharacterEncoding("UTF-8");

        /**
         * 获取用户名和密码
         */
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        /**
         *获取用户登录身份信息
         */
        String role = request.getParameter("role");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        User loginUser = userService.Login(user);
        if (loginUser != null) {
            //将用户信息放入作用域
            HttpSession session=request.getSession();
            session.setAttribute("user", loginUser);
            String customer = "customer";
            if (StringUtils.equals(role,customer)){
                request.getRequestDispatcher("ToClientIndexServlet").forward(request, response);
            }else{
                request.getRequestDispatcher("WEB-INF/views/main/home.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("msg","用户名或密码错误");
            request.getRequestDispatcher("WEB-INF/views/main/login.jsp").forward(request,response);
        }

    }
}
