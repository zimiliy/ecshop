package web.base;

import pojo.User;
import service.UserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户注册servlet
 * @author wyx
 * @version 1.0
 * @date 2020/11/9
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    UserService userService=new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        int sex = Integer.parseInt(request.getParameter("sex"));
        int age = Integer.parseInt(request.getParameter("age"));

        String role="customer";
        User user=new User(null,username,password,phone,sex,age,role);

        int result = userService.registerUser(user);
        if (result>0){
            /**
             * 注册成功返回信息
             */
            request.setAttribute("msg","注册成功");
            request.getRequestDispatcher("WEB-INF/views/main/register.jsp").forward(request,response);
        }else {
            request.setAttribute("msg","注册失败");
            request.getRequestDispatcher("WEB-INF/views/main/register.jsp").forward(request,response);
        }



    }
}
