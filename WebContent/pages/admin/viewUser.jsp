<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css"  media="all">
<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css"  media="all">
</head>
<body>
<div class="layui-fluid" style="margin: 15px;">
            <div class="row" style="padding:20px;">
                    <div class="layui-col-md4 layui-col-md-offset1">
                        <label style="font-size: 26px; font-family: "宋体" font-weight: 300;">查看用户</label>
                        <form class="layui-form" id="userForm">
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" readonly="readonly" name="username" value="${u1.u_username }" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                    <div class="layui-input-inline">
                                        <input type="text" readonly="readonly" name="password" value="${u1.u_password }" class="layui-input">
                                    </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">email</label>
                                    <div class="layui-input-inline">
                                        <input type="text" readonly="readonly" name="email" value="${u1.u_email }" class="layui-input">
                                    </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                  <label class="layui-form-label">生日</label>
                                  <div class="layui-input-inline">
                                    <input type="text" readonly="readonly" class="layui-input" value="${u1.u_birthday }">
                                  </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">所在地</label>
                                    <div class="layui-input-inline">
                                    <input type="text" name="city"  readonly="readonly" class="layui-input" value="${u1.u_city }">
                                  </div>
                            </div>
                        </form>
                    </div>
            <div class="layui-col-md3" style="text-align: center;padding-top:30px;">
                <form class="layui-form" id="imgForm">
                    <div class="layui-form-item">
                    <label style="font-size: 26px;font-weight: 300;">用户头像</label><br>
                    <img src="<%=basePath %>/${u1.u_img}" style="width:200px;height:200px"/>
                    <br>
                    </div>
                </form>
            </div>
            </div>
        </div>
        <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath %>/js/jquery.min.js"></script>
        <script src="<%=basePath %>/js/my.js" type="text/javascript"></script>
</body>
</html>