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
        <meta charset="utf-8">
        <title>首页</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="<%=basePath%>/css/my.css"  media="all">
        
        <style>
            #footer-content a{
                color:#1e9fff;
            }
            #footer-content a:hover{
                color:#111;
            }
            a:hover{
                cursor: pointer;
                color:#1e9fff;
            }
            #lcard{
                height:40px;
                overflow: hidden;
                text-overflow: ellipsis;
                display:-webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp:2; 
            }
            .info{
                padding-left: 30px;
            }
            .info i{
                padding-right: 20px;
            }
            #pageId a:hover{
                border:1px solid #009688;
            }
            #pageId a{
                color:#555555;
            }
            .lunbo{
                height:100%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="pages/common/header.jsp"></jsp:include>
        <div class="layui-carousel" id="test1">
          <div carousel-item="">
            <div><img class="lunbo" alt="" src="<%=basePath%>/img/lun1.jpg" style="width:100%;"></div>
            <div><img class="lunbo" alt="" src="<%=basePath%>/img/lun2.jpg" style="width:100%;"></div>
            <div><img class="lunbo" alt="" src="<%=basePath%>/img/lun3.jpg" style="width:100%;"></div>
            <div><img class="lunbo" alt="" src="<%=basePath%>/img/lun4.jpg" style="width:100%;"></div>
            <div><img class="lunbo" alt="" src="<%=basePath%>/img/lun5.jpg" style="width:100%;"></div>
          </div>
        </div>
        <div class="layui-fluid" style="background-color: #f2f2f2;">
            <div class="layui-container">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md8">
                        <div class="layui-card">
                            <c:forEach items="${requestScope.pages.getList() }" var="article">
                            <div class="layui-card">
                                <div class="layui-card-header">
                                    <h1><a href="<%=basePath%>/article/toViewArticle?a_id=${article.a_id}">${article.a_title }</a></h1>
                                </div>
                                <div class="info">
                                    <i>作者：<a href="javascript:;">${article.a_username }</a> </i><i>日期：${article.a_lasttime }</i><span>阅读</span>
                                </div>
                                <div class="layui-card-body" id="lcard">${article.a_article }
                                </div>
                            </div>
                            <hr class="layui-bg-black">
                            </c:forEach>
                            <div class="layui-card">
                                <form class="layui-form">
                                <ul id="pageId" class="pagination" style="float:left">
                                <li>
                                <a href="<%=basePath%>/index?pageN=1&pageSize=${requestScope.pages.pageSize}">首页</a>
                                </li>
                                <c:if test="${requestScope.pages.pageNum >2}">
                                    <li>
                                          <a href="<%=basePath%>/index?pageN=${requestScope.pages.pageNum-1}&pageSize=${requestScope.pages.pageSize}">
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
                                          <a style="background-color: #009688;color:#ffffff;" href="<%=basePath%>/index?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${i!=requestScope.pages.pageNum }">
                                        <li>
                                          <a href="<%=basePath%>/index?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                          ${i}
                                          </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${requestScope.pages.pageNum <requestScope.pages.pages}">
                                    <li>
                               <a href="<%=basePath%>/index?pageN=${requestScope.pages.pageNum+1}&pageSize=${requestScope.pages.pageSize}">&raquo; </a>
                                    </li>
                                </c:if>
                                <li>
                                     <a href="<%=basePath%>/index?pageN=${requestScope.pages.pages}&pageSize=${requestScope.pages.pageSize}">尾页</a>
                                </li>
                                <li>
                                 <a>每页显示${requestScope.pages.pageSize}条/共${requestScope.pages.total}条</a>
                                </li>
                           </ul>
                            </form>
                        </div>
                       </div>
                    </div>
                    <div class="layui-col-md4">
                        <div class="layui-card">
                            <div class="layui-card-header"><h1><b>水之源</b></h1></div>
                            <div class="layui-card-body">
                              水是生命之源，请珍惜每一滴水。<br>
                              水是人类生存必不可少的条件之一，没有水，也就没有生命的存在
                              节约和保护水资源，实现水资源的可持续利用，任重道远。
                            </div>
                        </div>
                        <div class="layui-card">
                            <div class="layui-card-header"><h1><b>最新归档</b></h1></div>
                            <div class="layui-card-body">
                                <ul>
                                    <c:forEach items="${requestScope.archives.getList() }" var="article">
                                    <li><a href="<%=basePath%>/article/toViewArticle?a_id=${article.a_id}">${fn:substring(article.a_lasttime,0,10) }<span style="margin-left:10px;">${article.a_title }</span></a></li></hr>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        
        
        <jsp:include page="pages/common/footer.jsp"></jsp:include>
        
        <script src="<%=basePath%>/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=basePath%>/layui/layui.all.js" charset="utf-8"></script>
        <script type="text/javascript">
        layui.use('carousel', function(){
              var carousel = layui.carousel,
              form = layui.form;;
              
              //建造实例
              carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式 fade
                ,height:'360px'
                ,interval:1500
                ,arrow:'hover'
              });
              carousel.on('change(test1)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
                  console.log(obj.index); //当前条目的索引
                  console.log(obj.prevIndex); //上一个条目的索引
                  console.log(obj.item); //当前条目的元素对象
                });     
            });
        </script>
    </body>
</html>
