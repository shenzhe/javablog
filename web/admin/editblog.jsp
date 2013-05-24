<%-- 
    Document   : addcategory.jsp
    Created on : 2012-2-17, 17:44:12
    Author     : shenzhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,com.shenzhe.blog.entity.CategoryEntity, com.shenzhe.blog.entity.BlogEntity"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/static/css/common.css" type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.5.1.min.js"></script>
        <title>修改博客</title>
        <jsp:useBean id="categoryModel" class="com.shenzhe.blog.model.CategoryModel" />
        <jsp:useBean id="blogModel" class="com.shenzhe.blog.model.BlogModel" />
    </head>
    <body>
        <div class="content">
        <h3>添加博客</h3>
        <form method="post" action="<%=request.getContextPath()%>/admin/updateBlogServlet">
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                BlogEntity be = blogModel.getBlog(id);            
            %>
            <div id="accordion" class="form-section">
                <div>
                    <h4><a href="#">General</a></h4>
                    <div class="bg box">
                        <dl>
                            <dt>Title：</dt>
                            <dd>
                               <input type="text" name="title" value="<%=be.getTitle()%>"/>
                            </dd>
                        </dl>
                        <dl>
                            <dt>分类：</dt>
                            <dd>
                                <select name="categoryid">
                                <%
                                
                                
                                List categoryList = categoryModel.getList();
                                for(int i=0; i<categoryList.size(); i++) {
                                    CategoryEntity ce = (CategoryEntity) categoryList.get(i);
                                %>
                                <option value="<%=ce.getId()%>" <%if(ce.getId() == be.getCategoryid()){%>selected<%}%>><%=ce.getTitle()%></option>
                                <% } %>
                                </select>
                            </dd>
                        </dl>
                        <dl>
                            <dt>内容：</dt>
                            <dd>
                                <textarea name="content" class="tinymce"><%=be.getContent()%></textarea>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <p>
                <input type="hidden" name="id" value="<%=be.getId()%>"/>
                <input type="submit" value="submit" />
            </p>
            
        </form>
        </div>
        <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/tiny_mce/jquery.tinymce.js"></script>
        <script type="text/javascript">
            $().ready(function() {
                $('textarea.tinymce').tinymce({
                    // Location of TinyMCE script
                    script_url : '<%=request.getContextPath()%>/static/js/tiny_mce/tiny_mce.js',

                    // General options
                    theme : "advanced",
                    plugins : "autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,advlist",

                    // Theme options
                    theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
                    theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
                    theme_advanced_toolbar_location : "top",
                    theme_advanced_toolbar_align : "left",
                    theme_advanced_statusbar_location : "bottom",
                    theme_advanced_resizing : true,

                    // Example content CSS (should be your site CSS)
                    content_css : "css/content.css",

                    // Drop lists for link/image/media/template dialogs
                    template_external_list_url : "lists/template_list.js",
                    external_link_list_url : "lists/link_list.js",
                    external_image_list_url : "lists/image_list.js",
                    media_external_list_url : "lists/media_list.js"
                });
            });
        </script>
    </body>
</html>
