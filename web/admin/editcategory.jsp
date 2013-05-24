<%-- 
    Document   : addcategory.jsp
    Created on : 2012-2-17, 17:44:12
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*, com.shenzhe.blog.entity.CategoryEntity" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <title>分类修改</title>
        <jsp:useBean id="category" class="com.shenzhe.blog.model.CategoryModel" />
    </head>
    <body>
        <div class="content">
        <h3>博客分类修改</h3>
        <form method="post" action="<%=request.getContextPath()%>/admin/updateCategoryServlet">
            <div id="accordion" class="form-section">
                <div>
                    <h4><a href="#">General</a></h4>
                    <div class="bg box">
                        <dl>
                            <dt>Title：</dt>
                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                CategoryEntity ce = category.getCategory(id);
                            %>
                            <dd>
                               <input type="text" name="title" value="<%=ce.getTitle()%>" />
                               <input type="hidden" name="id" value="<%=ce.getId()%>" />
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <p>
                <button>Submit form</button>
            </p>
        </form>
        </div>
    </body>
</html>
