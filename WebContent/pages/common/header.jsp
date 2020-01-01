<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
        <div class="layui-fluid" style="padding:0px;">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-sm12 layui-col-md12">
                    <ul class="layui-nav">
                        <li class="layui-nav-item layui-logo layui-this"><a href="<%=basePath%>/index">WATER</a></li>
                        <li class="layui-nav-item"><a href="<%=basePath%>/index"  target="_parent">主页</a></li>
                        <li class="layui-nav-item"><a href="<%=basePath%>/toforum">论坛</a></li>
                        <li class="layui-nav-item"><a href="<%=basePath%>/archives">归档</a></li>
                        <li class="layui-nav-item"><a href="<%=basePath%>/about" target="_parent">关于</a></li>
                        <c:if test="${user==null }">
                        <li class="layui-nav-item"><a href="<%=basePath%>/login" target="_parent">登录/注册</a></li>
                        </c:if>
                    </ul>
                    <ul class="layui-nav layui-layout-right">
                        <c:if test="${user!=null }">
                            <li class="layui-nav-item"><a href="javascript:;">
                              <img src="<%=basePath %>/${user.u_img}" class="layui-nav-img">
                              ${user.u_username}</a>
                              <dl class="layui-nav-child">
                                  <dd><a href="<%=basePath %>/user/userInfo" target="_black">基本资料</a></dd>
                                  <c:if test="${user.u_role==1 }">
                                    <dd><a href="<%=basePath %>/article/insertArticle">编写文章</a></dd>
                                    <dd><a href="<%=basePath %>/forum/toInsertForum">编写话题</a></dd>
                                    <dd><a href="<%=basePath %>/admin">后台</a></dd>
                                  </c:if>
                              </dl>
                            </li>
                            <li class="layui-nav-item"><a href="<%=basePath %>/user/outLogin">注销</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
