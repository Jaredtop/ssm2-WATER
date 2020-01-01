<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <title></title>
        <link href="<%=basePath %>/layui/css/layui.css" rel="stylesheet" />
        <link href="<%=basePath %>/css/bootstrap.min.css" rel="stylesheet"/>
        <style type="text/css">
            #pageId a:hover{
                border:1px solid #009688;
            }
            #pageId a{
                color:#555555;
            }
        </style>
    </head>
    <body>
        <div class="container" style="margin: 15px;">
                <div style="padding:10px;">
                    <h1>用户状态权限</h1>
                </div>
                <div class="layui-btn-group demoTable">
                      <button type="button" class="layui-btn" onclick="selectAllBtn();">全选</button>
                 </div>
                 <div class="layui-btn-group demoTable" style="float:right;">
                      <button type="button" class="layui-btn layui-btn-normal" onclick="setRoleS(1);">设为管理</button>
                      <button type="button" class="layui-btn layui-btn-danger" onclick="setRoleS(0);">设为用户</button>
                 </div>
                 <div class="layui-btn-group demoTable" style="float:right;margin-right:20px;">
                      <button type="button" class="layui-btn" onclick="setStatusS(1);">设为可用</button>
                      <button type="button" class="layui-btn layui-btn-danger" onclick="setStatusS(0);">设为禁用</button>
                 </div>
                 
                 <table class="layui-table" style="text-align: center;">
                    <colgroup>
                      <col width="5">
                      <col width="5">
                      <col width="80">
                      <col width="50">
                      <col width="60">
                      <col width="60">
                      <col width="80">
                      <col width="80">
                    </colgroup>
                    <thead>
                      <tr style="text-align: center;">
                        <th><input type="checkbox" id="all" onclick="selectAll(this);"></th>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>状态</th>
                        <th>角色</th>
                        <th>操作状态</th>
                        <th>操作角色</th>
                      </tr> 
                    </thead>
                    <tbody>
                      <c:forEach items="${requestScope.pages.getList()}" var="page">
                      <tr>
                        <th><input type="checkbox" class="u_id" name="u_id" value="${page.u_id }"></th>
                        <td>${page.u_id }</td>
                        <td>${page.u_username }</td>
                        <td>${page.u_password }</td>
                        <td>
                        <c:if test="${page.u_status==1 }">
                        <span class="layui-badge layui-bg-green">可用</span>
                        </c:if>
                        <c:if test="${page.u_status==0 }">
                        <span class="layui-badge layui-btn-danger">锁定</span>
                        </c:if>
                        </td>
                        <td>
                        <c:if test="${page.u_role==1 }">
                        <span class="layui-badge">管理</span>
                        </c:if>
                        <c:if test="${page.u_role==0 }">
                        <span class="layui-badge layui-bg-blue">用户</span>
                        </c:if>
                        </td>
                        <td>
                            <button type="button" onclick="return setStatus(${page.u_id},1);"class="layui-btn layui-btn-xs">设为可用</button>
                            <button type="button" onclick="return setStatus(${page.u_id},0);" class="layui-btn layui-btn-danger layui-btn-xs">设为禁用</button>
                        </td>
                        <td>
                            <button type="button" onclick="return setRole(${page.u_id},1);" class="layui-btn layui-btn-normal layui-btn-xs">设为管理</button></a>
                            <button type="button" onclick="return setRole(${page.u_id},0);" class="layui-btn layui-btn-danger layui-btn-xs">设为用户</button>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                  <form class="layui-form">
                      <ul id="pageId" class="pagination" style="float:left">
                            
                            <li>
                            <a href="<%=basePath%>/user/findByPage?pageN=1&pageSize=${requestScope.pages.pageSize}">首页</a>
                            </li>
                            <c:if test="${requestScope.pages.pageNum >2}">
                                <li>
                                      <a href="<%=basePath%>/user/findByPage?pageN=${requestScope.pages.pageNum-1}&pageSize=${requestScope.pages.pageSize}">
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
                                      <a style="background-color: #009688;color:#ffffff;" href="<%=basePath%>/user/findByPage?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                      ${i}
                                      </a>
                                    </li>
                                </c:if>
                                <c:if test="${i!=requestScope.pages.pageNum }">
                                    <li>
                                      <a href="<%=basePath%>/user/findByPage?pageN=${i}&pageSize=${requestScope.pages.pageSize}">
                                      ${i}
                                      </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${requestScope.pages.pageNum <requestScope.pages.pages}">
                                <li>
                           <a href="<%=basePath%>/user/findByPage?pageN=${requestScope.pages.pageNum+1}&pageSize=${requestScope.pages.pageSize}">&raquo; </a>
                                </li>
                            </c:if>
                            <li>
                                 <a href="<%=basePath%>/user/findByPage?pageN=${requestScope.pages.pages}&pageSize=${requestScope.pages.pageSize}">尾页</a>
                            </li>
                            <li>
                             <a>每页显示${requestScope.pages.pageSize}条/共${requestScope.pages.total}条</a>
                            </li>
                       </ul>
                  </form>
              </div>
        <script src="<%=basePath %>/layui/layui.all.js" type="text/javascript"></script>
        <script src="<%=basePath %>/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=basePath %>/js/jquery.timers.min.js" type="text/javascript"></script>
        <script src="<%=basePath %>/js/my.js" type="text/javascript"></script>
        <script type="text/javascript">
        function selectAll(obj){
            $(".u_id").prop("checked",obj.checked);
        }
        function selectAllBtn(){
            $("#all").prop("checked",true);
            $(".u_id").prop("checked",true);
        }
        function setStatus(u_id,status){
            var data1;
            if(status==1){
                data1="可用";
            }else{
                data1="禁用";
            }
            layer.open({
                title:'警告信息',
                content:'你确定要设置Id为（'+u_id+'）的用户状态为'+data1+'？',
                icon: 7,
                btn:['确定','取消'],
                btn1:function(index,layero){
                    $.ajax({
                        url:'<%=basePath%>/user/setStatus',
                        type:'POST',
                        data:{
                            u_id:u_id,
                            u_status:status
                        },
                        success:function(data){
                            layer.open({
                                title:'提示信息',
                                content:'设置状态成功！',
                                icon:1,
                                time:1000
                            });
                            $("body").oneTime('1s',function(){
                                $("body").html(data);
                            });
                        },
                        error:function(){
                            layer.open({
                                title:'错误信息',
                                icon: 2,
                                content:'设置状态失败！',
                            })
                        }
                    });
                    layer.close(index);
                }
            })
            
        }
        function setRole(u_id,role){
            var data1;
            if(role==1){
                data1="管理";
            }else{
                data1="用户";
            }
            layer.open({
                title:'警告信息',
                content:'你确定要设置Id为（'+u_id+'）的用户角色为'+data1+'？',
                icon: 7,
                btn:['确定','取消'],
                btn1:function(index,layero){
                    $.ajax({
                        url:'<%=basePath%>/user/setRole',
                        type:'POST',
                        data:{
                            u_id:u_id,
                            u_role:role
                        },
                        success:function(data){
                            layer.open({
                                title:'提示信息',
                                content:'设置用户角色成功!',
                                icon:1,
                                time:1000
                            });
                            $("body").oneTime('1s',function(){
                                $("body").html(data);
                            });
                            
                        },
                        error:function(){
                            layer.open({
                                title:'错误信息',
                                icon: 2,
                                content:'设置用户角色失败!',
                            })
                        }
                    });
                    layer.close(index);
                }
            })
        }
        function setRoleS(u_role){
            var arr=[];
            var data1;
            if(u_role==1){
                data1="管理";
            }else{
                data1="用户";
            }
            //遍历选中的checkbox
            $('input[name="u_id"]').each(function(){
                var state=$(this).prop('checked');
                if(state){
                    arr.push(+$(this).val());
                }
            })
            layer.open({
                title:'提示信息',
                icon: 7,
                content:'你选中的用户的角色为？'+data1,
                btn:['确定','取消'],
                btn1:function(index,layero){
                    $.ajax({
                        url:'<%=basePath%>/user/setRoleS',
                        type:'POST',
                        data:{
                            u_id:"["+arr+"]",
                            u_role:u_role
                        },
                        success:function(data){
                            layer.open({
                                title:'提示信息',
                                content:'设置用户角色成功!',
                                icon:1,
                                time:1000
                            });
                            $("body").oneTime('1s',function(){
                                $("body").html(data);
                            });
                        },
                        error:function(){
                            layer.open({
                                title:'错误信息',
                                icon: 2,
                                content:'设置用户角色失败!',
                            })
                        }
                    });
                    layer.close(index);
                }
            })
        }
        function setStatusS(u_status){
            var arr=[];
            var data1;
            if(u_status==1){
                data1="可用";
            }else{
                data1="禁用";
            }
            //遍历选中的checkbox
            $('input[name="u_id"]').each(function(){
                var state=$(this).prop('checked');
                if(state){
                    arr.push(+$(this).val());
                }
            })
            layer.open({
                title:'提示信息',
                icon: 7,
                content:'你选中的用户的状态为？'+data1,
                btn:['确定','取消'],
                btn1:function(index,layero){
                    $.ajax({
                        url:'<%=basePath%>/user/setStatusS',
                        type:'POST',
                        data:{
                            u_id:"["+arr+"]",
                            u_status:u_status
                        },
                        success:function(data){
                            layer.open({
                                title:'提示信息',
                                content:'设置用户状态成功!',
                                icon:1,
                                time:1000
                            });
                            $("body").oneTime('1s',function(){
                                $("body").html(data);
                            });
                        },
                        error:function(){
                            layer.open({
                                title:'错误信息',
                                icon: 2,
                                content:'设置用户状态失败!',
                            })
                        }
                    });
                    layer.close(index);
                }
            })
        }
        </script>
    </body>
</html>