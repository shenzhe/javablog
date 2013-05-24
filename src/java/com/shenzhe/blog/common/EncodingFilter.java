/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shenzhe.blog.common;

import java.io.IOException;
import java.util.Iterator;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;




public class EncodingFilter implements Filter {
    private String encoding = null;
    private String filterStr = null;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException{
        this.encoding = filterConfig.getInitParameter("encoding");
        this.filterStr = filterConfig.getInitParameter("filgerStr");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException{
        encoding = getEncoding();  
        if (encoding == null){  
            encoding = "UTF-8";  
        }  
        request.setCharacterEncoding(encoding);
        HttpServletRequest hreq = (HttpServletRequest) request;
        Iterator params = hreq.getParameterMap().values().iterator();
        chain.doFilter(request, response);
    } 

    @Override
    public void destroy(){
        encoding = null;
    }
    
    private String getEncoding() {
        return this.encoding;
    }
}