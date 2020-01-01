<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css"  media="all">
        <link rel="stylesheet" href="<%=basePath %>/css/my.css"  media="all">
        <style type="text/css">
            .content{
                width:100%;
                list-style:none;
                position: relative;
                padding: 20px 0;
                border-bottom: 1px solid #ffffff;
                background-color: #eaeaea;
                padding-bottom: 2px;
                margin-bottom:40px;
            }
            
            .post-title{
                margin: 0 0 18px;
                font-weight: 400;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }
            .post-title a{
                color:#01aaed;
            }
            .post-title a:hover{
                color:#ff5722;
                text-decoration:underline;
            }
            
            .post-author{
                font-size:16px;
                padding:0 10px 0 5px;
            }
            .post-comment{
                float:right;
            }
            
        </style>
    </head>
    <body>
        <div class="layui-fluid">
            <div class="row">
                    <div class="layui-col-md10 layui-col-md-offset1">
                        <div class="page-header">
                           <h1>论坛 <small>浏览话题</small></h1>
                        </div>
                            <div>
                                <div class="content">
                                    <h3 class="post-title">${forum.f_title }</h3>
                                    <a class="post-author" href="#">${forum.f_username }</a>
                                    <span>${forum.f_createtime }</span>
                                    <span class="post-comment">${forum.f_comment }条讨论</span>
                                </div>
                            </div>
                            <div class="layui-container">
            <form class="layui-form layui-form-pane" action="">
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">编辑</label>
                    <div class="layui-input-block" style="top: -6px;">
                        <textarea id="comment" placeholder="对于此话题有什么想说的吗？"
                            class="layui-textarea"></textarea>
                    </div>
                    <button type="button" style="float: right;"
                        class="layui-btn layui-btn-normal"
                        onclick="insertComment(${forum.f_id},'${user.u_username }');">评论</button>
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
            </div>
        </div>
        <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath %>/js/jquery.min.js"></script>
        <script src="<%=basePath %>/js/my.js"></script>
        <script type="text/javascript">
        function insertComment(f_id,f_username){
            var comment=$("#comment").val();
            var c_type=1;
            if(f_username==""){
                window.location.href="<%=basePath%>/login"; 
                return false;
            }
            $.ajax({
                url:'<%=basePath%>/article/insertComment',
                type : 'post',
                data : {
                    c_username : f_username,
                    c_comment : comment,
                    c_type : c_type,
                    a_id: f_id
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