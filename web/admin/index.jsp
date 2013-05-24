<%-- 
    Document   : index
    Created on : 2012-2-17, 10:21:40
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>shenzhe blog Admin</title>
</head>
<frameset  rows="35px,*" frameborder="0" framespacing="0px" >
    <frame src="<%=request.getContextPath()%>/admin/header.jsp"/>
    <frameset cols="198,*" frameborder="0" framespacing="0">
        <frame src="<%=request.getContextPath()%>/admin/menu.jsp" scrolling="no" />
        <frame src="<%=request.getContextPath()%>/admin/main.jsp" scrolling="auto" name="main" />
    </frameset>
    <noframes></noframes>
</frameset>
</html> 
