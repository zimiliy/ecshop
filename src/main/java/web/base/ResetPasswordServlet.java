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
 * 修改密码的servlet
 * @author wyx
 * @version 1.0
 * @date 2020/11/19
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    UserService userService=new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        User userOld = new User();
        userOld.setPassword(password);
        userOld.setUsername(username);
        User user1 = userService.Login(userOld);
        User user = new User();
        user.setUid(user1.getUid());
        user.setPassword(newPassword);
        if (password.equals(newPassword)){
            request.setAttribute("msg","旧密码用于新密码相同");
            request.getRequestDispatcher("WEB-INF/views/main/editPassword.jsp").forward(request,response);
        }else {
            int i = userService.resetPassword(user);
            if (i>0){
                request.setAttribute("msg","修改成功");
                request.getRequestDispatcher("WEB-INF/views/main/editPassword.jsp").forward(request,response);
            }else {
                request.setAttribute("msg","修改失败");
                request.getRequestDispatcher("WEB-INF/views/main/editPassword.jsp").forward(request,response);
            }
        }
    }
}
