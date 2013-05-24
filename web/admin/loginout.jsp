<%-- 
    Document   : loginout
    Created on : 2012-2-18, 21:34:03
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.getSession().removeAttribute("user");
    request.getRequestDispatcher("/login.jsp").forward(request, response);
%>
