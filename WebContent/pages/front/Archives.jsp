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
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"  media="all">
<link rel="stylesheet" href="<%=basePath%>/css/my.css"  media="all">
<style type="text/css">
            
            #article_a{
                text-decoration: none;
                color:#111;
            }
            #article_a:hover{
                color:#1e9fff;
            }
            a:hover{
                cursor: pointer;
                color:#1e9fff;
            }
            #pageId a:hover{
                border:1px solid #009688;
            }
            #pageId a{
                color:#555555;
            }
</style>
</head>
<body>
    <jsp:include page="/pages/common/header.jsp"></jsp:include>
    <div class="layui-fluid">
        <div class="layui-container">
        <fieldset class="layui-elem-field layui-field-title"
            style="margin: 30px;">
            <legend>
                <h3>Archives</h3>
            </legend>
        </fieldset>
            <ul class="layui-timeline">
                <c:forEach items="${requestScope.pages.getList() }" var="article">
                    <li class="layui-timeline-item" style="padding-bottom:7px;">
                       <i class="layui-icon layui-timeline-axis"></i>
                        <div class="layui-timeline-content layui-text">
                            <div class="layui-timeline-title">
                                <span style="padding-right: 20px;">${fn:substring(article.a_lasttime,0,10)}</span>
                                <a id="article_a" href="<%=basePath%>/article/toViewArticle?a_id=${article.a_id}">${article.a_title }</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <div class="">
                                <ul id="pageId" class="pagination" style="float:left">
                                <li>
                                <a href="<%=basePath%>/archives?pageN=1&pageSize=${requestScope.pages.pageSize}">首页</a>
                                </li>
                                <c:if test="${requestScope.pages.pageNum >2}">
                                    <li>
                                          <a href="<%=basePath%>/archives?pageN=${requestScope.pages.pageNum-1}&pageSize=${requestScope.pages.pageSize}">
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
                                          <a style="background-color: #009688;color:#ffffff;" href="<%=basePath%>/archives?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=requestScope.pages.pageNum }">
                                        <li>
                                          <a href="<%=basePath%>/archives?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${requestScope.pages.pageNum <requestScope.pages.pages}">
                                    <li>
                               <a href="<%=basePath%>/archives?pageN=${requestScope.pages.pageNum+1}&pageSize=${requestScope.pages.pageSize}">&raquo; </a>
                                    </li>
                                </c:if>
                                <li>
                                     <a href="<%=basePath%>/archives?pageN=${requestScope.pages.pages}&pageSize=${requestScope.pages.pageSize}">尾页</a>
                                </li>
                                <li>
                                 <a>每页显示${requestScope.pages.pageSize}条/共${requestScope.pages.total}条</a>
                                </li>
                           </ul>
                           <div style="clear:both;"></div>
               </div>
               
        </div>
    </div>
    <jsp:include page="/pages/common/footer.jsp"></jsp:include>
    <script src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath%>/js/my.js" charset="utf-8"></script>
</body>
</html>