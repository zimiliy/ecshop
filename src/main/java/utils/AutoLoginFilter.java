package utils;

import pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 用户登录拦截器
 * @author wyx
 * @version 1.0
 * @date 2020/11/9
 */
@WebFilter()
public class AutoLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("进入过滤器");

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request1= (HttpServletRequest) request;
        User user = (User) request1.getSession().getAttribute("user");
        if(user==null){
           request1.setAttribute("msg","用户未登录");
           request.getRequestDispatcher("views/main/login.jsp");
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
    }
}
