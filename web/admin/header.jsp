<%-- 
    Document   : header
    Created on : 2012-2-20, 14:42:29
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>

</head>

<body id="headerBody">
<div class="header">
    <h1>泽泽博客系统</h1>
    <div class="information">
        <strong>Powered by shenzhe</strong>
        <span>User : <%=session.getAttribute("user")%></span>
        <a target="_top" href="<%=request.getContextPath()%>/admin/loginout.jsp">Logout</a>
    </div>
</div>
</body>
</html>
