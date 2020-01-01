<%@page import="com.jared.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>WATER 水之源 后台管理</title>
  <link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css">
  <link rel="stylesheet" href="<%=basePath %>/css/my.css">
  <style type="text/css">
    #info{
        font-size: 30px;
        color: #0000FF;
        position: fixed;
        top:250px;
        left:40%;
    }
  </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">WATER 水之源</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="<%=basePath%>/admin">后台首页</a></li>
      <li class="layui-nav-item"><a href="<%=basePath %>/index">前台首页</a></li>
      <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toArticleManager();">文章管理</a></li>
      <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toForumManager();">话题管理</a></li>
      <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toCommentManager();">评论管理</a></li>
      <li class="layui-nav-item"><a href="javascript:;" onclick="javascript: toUserInfo();">基本资料</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="<%=basePath %>/${user.u_img}" class="layui-nav-img">
          ${user.u_username}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;" onclick="javascript: toUserInfo();">基本资料</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="<%=basePath %>/user/outLogin">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">文章管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="javascript: toArticleManager();">文章管理</a></dd>
            <dd><a href="javascript:;" onclick="javascript: toInsertArticle();">编写文章</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">论坛话题管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="javascript: toForumManager();">话题管理</a></dd>
            <dd><a href="javascript:;" onclick="javascript: toInsertForum();">编写话题</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">评论管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="javascript: toCommentManager();">评论管理</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="javascript: toUserManager();">用户管理</a></dd>
            <dd><a href="javascript:;" onclick="javascript: toInsertUser();">添加用户</a></dd>
            <dd><a href="javascript:;" onclick="javascript: toUserStatusRole();">用户状态权限</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  <!-- 内容主体区域 -->
  <div class="layui-body">
        <div id="content">
            <img src="<%=basePath %>/img/logo.jpg" style="width:100%;height:100%;"/>
            <label id="info">欢迎您(<span style="color:red;">${user.u_username }</span>)，进入WATER 后台管理！</label>
        </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © 水之源 Order By Jared - 友情链接
  </div>
</div>
<script src="<%=basePath %>/layui/layui.js"></script>
<script src="<%=basePath %>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath %>/js/my.js" type="text/javascript"></script>
<script type="text/javascript">
function toUserInfo(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/user/userInfo\" width=\"100%\" height=\"100%\"></object>";
}
function toUserManager(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/user/userManager\" width=\"100%\" height=\"100%\"></object>";
}
function toInsertUser(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/user/insertUser\" width=\"100%\" height=\"100%\"></object>";
}
function toUserStatusRole(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/user/toUserStatusRole\" width=\"100%\" height=\"100%\"></object>";
}
function toArticleManager(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/article/toArticleManager\" width=\"100%\" height=\"100%\"></object>";
}
function toInsertArticle(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/article/insertArticle\" width=\"100%\" height=\"100%\"></object>";
}
function toCommentManager(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/article/toCommentManager\" width=\"100%\" height=\"100%\"></object>";
}
function toForumManager(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/forum/toForumManager\" width=\"100%\" height=\"100%\"></object>";
}
function toInsertForum(){
    document.getElementById("content").innerHTML="<object type=\"text/html\" data=\"<%=basePath%>/forum/toInsertForum\" width=\"100%\" height=\"100%\"></object>";
}
</script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>