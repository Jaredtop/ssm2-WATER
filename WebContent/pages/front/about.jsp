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
        <title>about me</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="<%=basePath%>/css/my.css"  media="all">
        <style type="text/css">
            #about{
            }
            #about h3{
                font-size:18px;
                font-weight: 600;
                font-style: normal;
                font-variant: small-caps;
                padding-bottom:4px;
            }
            #about p{
                padding-left:10px;
                line-height: 30px;
            }
            
        </style>
    </head>
    <body>
        <jsp:include page="/pages/common/header.jsp"></jsp:include>
        <div class="layui-fluid" style="background-color: #f2f2f2;margin-top:7px;">
            <div class="layui-container">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                             <div class="page-header" style="margin-left:5px;padding-left:5px;">
                                  <h1>关于 <small>联系方式</small></h1>
                                </div>
                            <div class="layui-row" id="about" style="padding-left:15px;">
                                <h3>本人</h3>
                                <p>在读学生</p>
                                <p>如你所见</p>
                                <p>技术很菜</p>
                                <p>希望有一天能改变这种现态</p>
                                <p>致此</p>
                                <p>加油！</p>
                                <h3>交流</h3>
                                <p>QQ:934556594</p>
                                <h3>联系</h3>
                                <p><a href="https://blog.csdn.net/qq_39105615" target="_black">Blog@Jared's Blog</a></p>
                                <p><a href="https://github.com/Jaredtop" target="_black">Github@Jared</a></p>
                                <p><a href="mailto:jared.top@outlook.com" target="_black">Email@Jared</a></p>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/pages/common/footer.jsp"></jsp:include>
        
        <script src="<%=basePath%>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath%>/js/my.js" charset="utf-8"></script>
    </body>
</html>
