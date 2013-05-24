<%-- 
    Document   : addcategory.jsp
    Created on : 2012-2-17, 17:44:12
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <title>链接添加</title>
    </head>
    <body>
        <div class="content">
        <h3>链接添加</h3>
        <form method="post" action="<%=request.getContextPath()%>/admin/addLinkServlet">
            <div id="accordion" class="form-section">
                <div>
                    <h4><a href="#">General</a></h4>
                    <div class="bg box">
                        <dl>
                            <dt>Title：</dt>
                            <dd>
                               <input type="text" name="title" />
                            </dd>
                        </dl>
                        <dl>
                            <dt>url：</dt>
                            <dd>
                               <input type="text" name="url" />
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
