/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException{
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String user = (String) httpRequest.getSession().getAttribute("user");
        if(null == user) {
            //request.getRequestDispatcher("/login.jsp").forward(request, response);
            httpResponse.sendRedirect(httpRequest.getContextPath()+"/login.jsp");
        } else {
            chain.doFilter(request, response);
        }
    } 

    @Override
    public void destroy(){
        
    }
}