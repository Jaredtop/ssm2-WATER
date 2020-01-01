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
                        <label style="font-size: 26px; font-family: "宋体" font-weight: 300;">编辑用户</label>
                         <form action="<%=basePath%>/user/saveInfo" class="layui-form" id="userForm" method="post">
                            <input type="text" name="u_id" hidden="hidden" value=${u.u_id }>
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" id="username" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" value="${u.u_username }" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">密码</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="password" name="password"  value="${u.u_password}" lay-verify="required" lay-reqtext="密码是必填项，岂能为空？" autocomplete="off" class="layui-input">
                                    </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">email</label>
                                    <div class="layui-input-inline">
                                        <input type="text" id="email" name="email" value="${u.u_email }" lay-verify="email" autocomplete="off" class="layui-input">
                                    </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-inline">
                                  <label class="layui-form-label">生日</label>
                                  <div class="layui-input-inline">
                                    <input type="text" name="birthday" class="layui-input" id="test1" value="${u.u_birthday }">
                                  </div>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">所在地</label>
                                    <div class="layui-input-inline">
                                    <select name="city" lay-filter="location">
                                        <option value="${u.u_city}">${u.u_city}</option>
                                        <option value="重庆">重庆</option>
                                        <option value="北京">北京</option>
                                        <option value="上海">上海</option>
                                        <option value="浙江">浙江</option>
                                        <option value="湖南">湖南</option>
                                      </select>
                                  </div>
                            </div>
                            <div class="layui-form-item layui-col-md-offset1">
                                <div class="layui-input-inline">
                                      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
                                      <button type="reset" class="layui-btn layui-btn-primary">恢复</button>
                                </div>
                            </div>
                        </form>
                    </div>
                <div class="layui-col-md3" style="text-align: center;padding-top:30px;">
                        <form action="<%=basePath%>/user/save" class="layui-form" method="post" enctype="multipart/form-data">
                            <div class="layui-form-item">
                                <label style="font-size: 26px;font-weight: 300;">用户头像</label><br>
                                <img id="u_img" src="<%=basePath %>/${u.u_img}" style="width:200px;height:200px"/>
                            <br>
                            </div>
                            <span>更换头像<i class="layui-icon"></i></span><input type="file" name="image"></input>
                            <input type="text" name="u_id" hidden="hidden" value=${u.u_id }>
                            <input type="text" name="u_img" hidden="hidden" value=${u.u_img }>
                            <div class="layui-form-item layui-col-md-offset1">
                                <div class="layui-input-inline">
                                      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
                                </div>
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