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
                           <h1>论坛 <small>修改话题</small></h1>
                        </div>
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <h3>话题标题</h3>
                                <textarea id="f_title" style="width: 600px;height:200px;">${forum.f_title }</textarea>
                            </div>
                            <div class="layui-form-item layui-col-md-offset1">
                                <div class="layui-input-inline">
                                      <button type="button" id="saveBtn" class="layui-btn">保存修改</button>
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
        $("#saveBtn").click(function(){
            var f_id=${forum.f_id};
            var f_title=$("#f_title").val();
            $.ajax({
                url:'<%=basePath%>/forum/update',
                type:'post',
                data:{
                    f_id : f_id,
                    f_title : f_title
                },
                success:function(data){
                    $("body").html(data);
                },
                error:function(){
                    layer.open({
                        title:'提示信息',
                        content:'修改话题失败'
                    })
                }
                
            })
        });
        </script>
</body>
</html>