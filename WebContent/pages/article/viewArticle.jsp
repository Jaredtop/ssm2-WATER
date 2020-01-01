<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>${article.a_title }</title>
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"
    media="all">
<link rel="stylesheet" href="<%=basePath%>/css/bootstrap.min.css"
    media="all">
<link rel="stylesheet" href="<%=basePath%>/editormd/css/editormd.css"
    media="all">
<style type="text/css">
a{
    text-decoration: none;
    color: #111;
}

a:hover {
    color: #1e9fff;
    text-decoration: none;
    cursor: pointer;
}
</style>
</head>
<body>
    <div class="layui-fluid" style="margin-top: 15px;">
        <div class="row" style="margin-bottom: 15px;">
            <div class="layui-col-md10 layui-col-md-offset1">
                <fieldset class="layui-elem-field layui-field-title">
                    <legend>
                        <h3 style="text-align: center;">${article.a_title }</h3>
                    </legend>
                </fieldset>
                <div id="content">
                    <textarea>${article.a_article }</textarea>
                </div>
                <hr class="layui-bg-black">
                <div style="padding-left: 50px;">
                    本文作者：<a href="javascript:;">${article.a_username }</a> 发表于
                    ${article.a_lasttime }
                </div>
                <hr class="layui-bg-black">
            </div>
        </div>
        <div class="layui-container">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">编辑</label>
                    <div class="layui-input-block" style="top: -6px;">
                        <textarea id="comment" placeholder="对于此文章有什么想说的吗？"
                            class="layui-textarea"></textarea>
                    </div>
                    <button type="button" style="float: right;"
                        class="layui-btn layui-btn-normal"
                        onclick="insertComment(${article.a_id},'${user.u_username }');">评论</button>
                </div>
            </form>
            <h3 style="margin-bottom:20px;">
                评论 <span class="label label-default">最新列表</span>
            </h3>
            <%
                int i = 1;
            %>
            <c:forEach items="${comments }" var="comment">
                <c:if test="${comment.c_status!=0 }">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="padding-left: 30px;">
                            <h3 class="panel-title"><a><i class="layui-icon layui-icon-user"></i>${comment.c_username}</a> 于 ${comment.c_createtime }发表<span
                                style="float: right;">#<%=i++%>楼
                            </span></h3>
                        </div>
                        <div class="panel-body">${comment.c_comment }</div>
                    </div>
                </c:if>
            </c:forEach>

        </div>

        <hr class="layui-bg-black">
        <blockquote class="layui-elem-quote">
            <p>&copy; WATER 版权声明</p>
            <p>
                最终解释权归<a href="javascript:;">Jared</a> 所有
            </p>
        </blockquote>
    </div>
    <script src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/my.js" type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/flowchart.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/jquery.flowchart.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/marked.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/prettify.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/raphael.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/underscore.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/lib/sequence-diagram.min.js"
        type="text/javascript"></script>
    <script src="<%=basePath%>/editormd/editormd.js" charset="utf-8"></script>
    <script type="text/javascript">
       var testEditor;
        $(function(){
            testEditor = editormd.markdownToHTML("content", {
                 htmlDecode:"style,script,iframe",
                 syncScrolling: "single",  
                 emoji: true,
                 taskList: true, 
                 tocm: true,         // Using [TOCM]
                 tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                 flowChart: true,             // 开启流程图支持，默认关闭
                 sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
                 codeFold:true,
            });
        });
        </script>
    <script type="text/javascript">
        function insertComment(a_id,u_username){
            var comment=$("#comment").val();
            var c_type=0;
            if(u_username==""){
                window.location.href="<%=basePath%>/login"; 
                return false;
            }
            $.ajax({
                url:'<%=basePath%>/article/insertComment',
                type : 'post',
                data : {
                    c_username : u_username,
                    c_comment : comment,
                    c_type : c_type,
                    a_id: a_id
                },
                success : function(data) {
                    layer.open({
                        title : '提示信息',
                        icon:1,
                        content : '评论成功！',
                        time:1000
                    })
                    $("body").oneTime('1s',function(){
                        $("body").html(data);
                    });
                },
                error : function() {
                    layer.open({
                        title : '提示信息',
                        icon:2,
                        content : '评论失败'
                    })
                }

            })
        }
        
        </script>
</body>
</html>