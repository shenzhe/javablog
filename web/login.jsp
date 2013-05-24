<%-- 
    Document   : login
    Created on : 2012-2-17, 18:59:31
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional //EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Blog Admin</title>
<link href="<%=request.getContextPath()%>/static/css/login.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
</head>
<body>
<div class="login">
    <div class="login-title"></div>
    <div class="login-main">
        <div class="login-header">用户登录</div>
        <div class="login-content">
            <form action="<%=request.getContextPath()%>/loginServlet" method="post">
                        <%
                            String result=(String)request.getAttribute("error");
                            if(result!=null){
                                if("NOUSER".equals(result)){
                                    out.println("<p>用户名不存在</p>");
                                }else{
                                    out.println("<p>密码错误</p>");

                                }
                            }
                         %>
                        <p><label for="user">Username</label> <input type="text" name="username" class="input" id="username" /></p>
                        <p><label for="pass">Password</label> <input type="password" name="password"  class="input" id="passowrd"/></p>
                        <p class="fr"> <input type="submit" value="Login" class="loginbutton"/></p>
            </form>
        </div>
    </div>
</div>
</body>

</html>
