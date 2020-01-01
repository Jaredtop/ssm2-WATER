<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css"  media="all">
        <link rel="stylesheet" href="<%=basePath %>/css/my.css"  media="all">
        
    </head>
    <body>
        <div class="layui-fluid">
            <div class="row">
                    <div class="layui-col-md4 layui-col-md-offset1">
                        <div class="page-header">
                           <h1>论坛 <small>添加话题</small></h1>
                        </div>
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <h3>话题标题</h3>
                                <textarea id="f_title" style="width: 600px;height:200px;"></textarea>
                            </div>
                            <div class="layui-form-item layui-col-md-offset1">
                                <div class="layui-input-inline">
                                      <button type="button" id="insertBtn" class="layui-btn">添加</button>
                                      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>
                    </div>
            </div>
        </div>
        <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath %>/js/jquery.min.js"></script>
        <script type="text/javascript">
        $("#insertBtn").click(function(){
            var f_title=$("#f_title").val();
            var f_username="${user.u_username}";
            var f_createtime="";
            var f_comment=0;
            var f_status=0;
            $.ajax({
                url:'<%=basePath%>/forum/insert',
                type:'post',
                data:{
                    f_title : f_title,
                    f_username : f_username,
                    f_createtime : f_createtime,
                    f_comment : f_comment,
                    f_status : f_status
                },
                success:function(data){
                    $("body").html(data);
                },
                error:function(){
                    layer.open({
                        title:'提示信息',
                        content:'添加话题失败'
                    })
                }
                
            })
        });
        </script>
</body>
</html>