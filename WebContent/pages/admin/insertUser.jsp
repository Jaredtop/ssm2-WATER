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
                             <h1>用户 <small>添加用户</small></h1>
                     </div>
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="username" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入用户名" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                <div class="layui-input-inline">
                                    <input type="password" id="password" lay-verify="required" lay-reqtext="密码是必填项，岂能为空？" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">email</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="email" name="email" placeholder="请输入邮箱" lay-verify="email" autocomplete="off" class="layui-input">
                                    </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                  <label class="layui-form-label">生日</label>
                                  <div class="layui-input-inline">
                                    <input type="text" id="birthday" name="birthday" lay-verify="date" lay-reqtext="生日是必填项，岂能为空？" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                                  </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">所在地</label>
                                    <div class="layui-input-inline">
                                      <select id="city" name="city" lay-verify="required" lay-reqtext="所在地是必填项，岂能为空？" lay-filter="location">
                                        <option value=""></option>
                                        <option value="0">重庆</option>
                                        <option value="1">北京</option>
                                        <option value="2">上海</option>
                                        <option value="3">浙江</option>
                                        <option value="4">湖南</option>
                                      </select>
                                    </div>
                            </div>
                            <div class="layui-form-item layui-col-md-offset1">
                                <div class="layui-input-inline">
                                      <button type="button" id="insertBtn" class="layui-btn" lay-submit="" lay-filter="demo1">添加</button>
                                      <button type="reset" class="layui-btn layui-btn-primary">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
            </div>
        </div>
        <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath %>/js/jquery.min.js"></script>
        <script type="text/javascript">
           layui.use(['form', 'layedit', 'laydate'], function(){
               var form = layui.form
               ,layer = layui.layer
               ,layedit = layui.layedit
               ,laydate = layui.laydate;
               
               //日期
               //常规用法
               laydate.render({
                   elem: '#test1'
               });
             })
        </script>
        <script type="text/javascript">
        $("#insertBtn").click(function(){
            var u_username=document.getElementById("username").value;
            var u_password=$("#password").val();
            var u_email=$("#email").val();
            var u_birthday=document.getElementById("birthday").value;
            var u_city=document.getElementById("city").value;
            var arr=["重庆","北京","上海","浙江","湖南"];
            for (var i=0;i<arr.length;i++)
            { 
                if(arr[u_city]==arr[i])
                {
                    u_city=arr[i];
                }
            }
            var u_status=1;
            var u_role=0;
            var u_img="img/avatar.jpg";
            $.ajax({
                url:'<%=basePath%>/user/insert',
                type:'post',
                data:{
                    u_username:u_username,
                    u_password:u_password,
                    u_email:u_email,
                    u_birthday:u_birthday,
                    u_city:u_city,
                    u_status:u_status,
                    u_role:u_role,
                    u_img:u_img
                },
                success:function(data){
                    $("body").html(data);
                },
                error:function(){
                    layer.open({
                        title:'提示信息',
                        content:'添加用户失败'
                    })
                }
                
            })
        });
        </script>
</body>
</html>