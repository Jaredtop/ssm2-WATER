<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Archives</title>
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"  media="all">
<link rel="stylesheet" href="<%=basePath%>/css/my.css"  media="all">
<style type="text/css">
    body{
        font-size:14px;
        font-weight: 200;
    }
    .content{
        background-color: #eaeaea;
        padding-bottom: 2px;
    }
    .content ul{
        padding:0 20px;
    }
    .content ul li{
        list-style:none;
        position: relative;
        padding: 20px 0;
        border-bottom: 1px solid #ffffff;
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
    <jsp:include page="/pages/common/header.jsp"></jsp:include>
    <div class="layui-fluid" style="padding: 20px;">
                <div class="layui-container">
                    <div class="page-header">
                      <h1>论坛 <small>话题讨论</small></h1>
                    </div>
                    <div class="layui-row" id="post">
                      <div class="layui-col-md8 layui-col-md-offset2">
                          <div class="content">
                            <ul>
                            <c:forEach items="${requestScope.pages.getList() }" var="forum">
                                <li>
                                    <h3 class="post-title"><a href="<%=basePath%>/forum/toViewforum?f_id=${forum.f_id}" target="_black">${forum.f_title }</a></h3>
                                    <a class="post-author" href="#">${forum.f_username }</a>
                                    <span>${forum.f_createtime }</span>
                                    <span class="post-comment">${forum.f_comment }条讨论</span>
                                </li>
                             </c:forEach>
                            </ul>
                            
                          </div>
                          <div class="">
                                <ul id="pageId" class="pagination" style="float:left">
                                <li>
                                <a href="<%=basePath%>/toforum?pageN=1&pageSize=${requestScope.pages.pageSize}">首页</a>
                                </li>
                                <c:if test="${requestScope.pages.pageNum >2}">
                                    <li>
                                          <a href="<%=basePath%>/toforum?pageN=${requestScope.pages.pageNum-1}&pageSize=${requestScope.pages.pageSize}">
                                                                                                                            &laquo;
                                          </a>
                                    </li>
                                </c:if>
                                <c:choose>
                                    <c:when test="${requestScope.pages.pages<=5}">
                                        <c:set var="begin" value="1"></c:set>
                                        <c:set var="end" value="${requestScope.pages.pages}"></c:set>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="begin" value="${requestScope.pages.pageNum-1}"></c:set>
                                        <c:set var="end" value="${requestScope.pages.pageNum+3}"></c:set>
                                        
                                        <!-- 头溢出 -->
                                        <c:if test="${begin<1 }">
                                            <c:set var="begin" value="1"></c:set>
                                            <c:set var="end" value="5"></c:set>
                                        </c:if>
                                        
                                        <!-- 尾溢出  -->
                                        <c:if test="${end>requestScope.pages.pages }">
                                            <c:set var="begin" value="${requestScope.pages.pages-4}"></c:set>
                                            <c:set var="end" value="${requestScope.pages.pages}"></c:set>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                                <c:forEach begin="${begin}" end="${end}" var="i">
                                    <c:if test="${i==requestScope.pages.pageNum }">
                                        <li>
                                          <a style="background-color: #009688;color:#ffffff;" href="<%=basePath%>/toforum?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=requestScope.pages.pageNum }">
                                        <li>
                                          <a href="<%=basePath%>/toforum?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${requestScope.pages.pageNum <requestScope.pages.pages}">
                                    <li>
                               <a href="<%=basePath%>/toforum?pageN=${requestScope.pages.pageNum+1}&pageSize=${requestScope.pages.pageSize}">&raquo; </a>
                                    </li>
                                </c:if>
                                <li>
                                     <a href="<%=basePath%>/toforum?pageN=${requestScope.pages.pages}&pageSize=${requestScope.pages.pageSize}">尾页</a>
                                </li>
                                <li>
                                 <a>每页显示${requestScope.pages.pageSize}条/共${requestScope.pages.total}条</a>
                                </li>
                           </ul>
                           <div style="clear:both;"></div>
               </div>
                      </div>
                      
                    </div>
                </div>
        </div>
    <jsp:include page="/pages/common/footer.jsp"></jsp:include>
    <script src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <script src="<%=basePath%>/js/my.js" charset="utf-8"></script>
</body>
</html>