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
        <title>登录&注册</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css"  media="all">
        <style type="text/css">
            body{
                background-image: url("<%=basePath %>/img/logo.jpg");
                background-attachment: fixed;
                background-size: 100%;
                background-repeat: no-repeat;
            }
            #form-top{
                margin-bottom: 10px;
                text-align: center;
            }
            a:hover{
                color:#EC971;
            }
            .info{
                font-size:18px;
                width:100px;
            }
            #info1{
                position: absolute;
                left:100%;
                top:9px;
            }
            #info2{
                position: absolute;
                left:100%;
                top:50px;
            }
        </style>
    </head>
    <body>
        <div class="layui-container" style="margin-top:120px;">
            <div class="layui-row layui-col-xs12 layui-col-sm12">
                <div class="layui-col-md6 layui-col-md-offset3" style="background-color: #64b6f4;">
                    <div class="layui-row" id="form-top">
                        <label style="font-size:24px;color:white;padding-right:8%;">
                            <a href="#" id="loginBtn" style="text-decoration: none;border-bottom:2px solid #02aaf0;color:#02aaf0">登录</a>
                        </label>
                        <label style="font-size:24px;color:white;padding-left:8%;">
                            <a href="#" id="registerBtn" style="text-decoration:none;">注册</a>
                        </label>
                    </div>
                    <form id="loginForm" method="post" action="<%=basePath %>/user/login" method="get" class="layui-form layui-col-md8 layui-col-md-offset1">
                        <div class="layui-form-item">
                            <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i>用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                                <div class="layui-input-block">
                                  <input type="password" name="password" lay-verify="required" lay-reqtext="密码是必填项，岂能为空？" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                                <label class="layui-form-label"><i class="layui-icon layui-icon-vercode"></i>验证码</label>
                                <div class="layui-input-inline" style="width: 41%;">
                                    <input type="text" id="check" name="check" lay-verify="required" lay-reqtext="验证码是必填项，岂能为空？" autocomplete="off" placeholder="请输入验证码" class="layui-input">
                                </div>
                                <div class="">
                                    <input id="code" onclick="createCode()" type="button" style="background:none;border: 1px solid #00adea;height:38px;width:100px;"/>
                                </div>
                          </div>
                        <div class="layui-form-item layui-col-md-offset2">
                            <div class="layui-input-block">
                                  <button type="submit" onclick="return checkcode();" class="layui-btn" lay-submit="" lay-filter="demo1">登录</button>
                                  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                    <form id="registerForm" onsubmit="return checkForm();" action="<%=basePath %>/user/register" method="post" class="layui-form layui-col-md8 layui-col-md-offset1">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" onblur="return checkName();" id="username" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                            <span class="info" id="info1"></span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                            <div class="layui-input-block">
                                <input type="password" id="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">确定密码</label>
                            <div class="layui-input-block">
                                <input type="password" id="upassword" name="upassword" onblur="validate()" placeholder="请输入确定密码" autocomplete="off" class="layui-input">
                            </div>
                            <span class="info" id="info2"></span>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">email</label>
                                <div class="layui-input-block">
                                    <input type="text" id="email" name="email" placeholder="请输入邮箱" lay-verify="email" autocomplete="off" class="layui-input">
                                </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-block">
                              <label class="layui-form-label">生日</label>
                              <div class="layui-input-block">
                                <input type="text" name="birthday" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                              </div>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">所在地</label>
                                <div class="layui-input-block">
                                  <select id="city" name="city" lay-filter="location">
                                    <option value=""></option>
                                    <option value="0">重庆</option>
                                    <option value="1">北京</option>
                                    <option value="2">上海</option>
                                    <option value="3">浙江</option>
                                    <option value="4">湖南</option>
                                  </select>
                                </div>
                                
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">邮箱验证码</label>
                                <div class="layui-input-inline" style="width:100px;">
                                    <input type="text" id="emailcode" name="emailcode" lay-verify="required" lay-reqtext="邮箱验证码是必填项，岂能为空？" placeholder="输入验证码" autocomplete="off" class="layui-input">
                                </div>
                                <input type="button" style="background:none;border: 1px solid #00adea;height:38px;width:160px;" id="getcode" value="获取邮箱验证码"></input>
                        </div>
        
                        <div class="layui-form-item layui-col-md-offset2">
                            <div class="layui-input-block">
                                  <button type="submit" onclick="return checkForm2();" class="layui-btn" lay-submit="" lay-filter="demo1">注册</button>
                                  <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
        <script src="<%=basePath %>/js/jquery.min.js"></script>
        <script src="<%=basePath %>/js/my.js"></script>
        <script src="<%=basePath %>" type="text/javascript"></script>
        <script type="text/javascript">
        
            function checkName(){
                var data=document.getElementById("username").value;
                if(data!=""){
                    $.post(
                            'user/checkName',
                            'u_username={"username":"'+data+'"}',
                            function(result){
                                  var jsonData=JSON.parse(result);
                                  if(jsonData==null){
                                      $("#info1").text("可以注册");
                                      $("#info1").css({'color':'green'});
                                  }else{
                                      $("#info1").text("已被注册");
                                      $("#info1").css({'color':'red'});
                                  }
                    });
                }else{
                    $("#info1").text("");
                }
                
            }
            
        </script>
        <script type="text/javascript">
            $("#registerForm").hide();
            $("#registerBtn").click(function(){
                $("#loginBtn").css({'border':'none','color':'#393D49'});
                $(this).css({'border-bottom':'2px solid #02aaf0','color':'#02aaf0'});
                $("#loginForm").hide();
                $("#registerForm").show();
                
            });
            $("#loginBtn").click(function(){
                $("#registerBtn").css({'border':'none','color':'#393D49'});
                $(this).css({'border-bottom':'2px solid #02aaf0','color':'#02aaf0'});
                $("#registerForm").hide();
                $("#loginForm").show();
                
            });
            
        </script>
        <script type="text/javascript">
                var code;
                var emailbefore;//输入的邮箱
                var code2;       //获取到的验证码
                function createCode(){
                    //首先默认code为空字符串
                    code = '';
                    //设置长度，这里看需求，设置了4个字符
                    var codeLength = 4;
                    var codeV = document.getElementById('code');
                    //设置随机字符
                    var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
                    //循环codeLength 我设置的4就是循环4次
                    for(var i = 0; i < codeLength; i++){
                        //设置随机数范围,这设置为0 ~ 36
                        var index = Math.floor(Math.random()*36);
                        //字符串拼接 将每次随机的字符 进行拼接
                        code += random[index];
                    }
                    //将拼接好的字符串赋值给展示的Value
                    codeV.value = code;
                }
            window.onload=function(){
                createCode();
            }
            function checkcode(){
                var check=$("#check").val();
                var codeV=$("#code").val();
                if(check.toUpperCase()!=codeV){
                    layer.msg('验证码输入错误！',{icon:2});
                    return false;
                }
            }
            function validate(){
                var password=document.getElementById('password').value;
                var upassword=document.getElementById('upassword').value;
                if(password!=upassword){
                    $("#info2").text("两次密码不一致");
                    $("#info2").css({'color':'red'});
                }else{
                    $("#info2").text("");
                }
            }
            function checkForm2(){var emailafter=document.getElementById('email').value;
                var email=document.getElementById('emailcode').value;
                if(email!=code2){
                    layer.msg('验证码错误！',{icon:2});
                    return false;
                }else if(email==code2){
                    if(emailbefore!=emailafter){
                        layer.msg('验证码邮箱不匹配！',{icon:2});
                        return false;
                    }
                }else{
                    layer.msg('注册成功！',{icon:1,time:500});
                    return true;
                }
            }
            
            var t; //倒计时对象
            $("#getcode").click(function(){
                if($("#getcode").val()=="获取邮箱验证码"){
                    getcode($(this));
                }
            });
            //获取验证码
            function getcode(e) {
                emailbefore = document.getElementById("email").value;
                    //这里写死了 应该调用获取验证码的接口
                    if(emailbefore!=""){
                        $.post(
                                '<%=basePath%>/user/getCode',
                                'email={email:"'+emailbefore+'"}',
                                function(result){
                                    var json=JSON.parse(result),
                                    emailbefore=json.email;
                                    code2=json.code;
                                    
                        });
                         
                            //按照指定的周期（以毫秒计）来调用函数或计算表达式。
                            //最好是在ajax请求之后再调用函数
                            t = setInterval(function () {
                                    countdown(e);
                                }, 1000)
                        //获取验证码成功后调用倒计时函数
                            countdown(e);
                        }
                  }
                
            var time = 60;
            function countdown(e){
                if (time == 0) {
                //这里时设置当时间到0的时候重新设置点击事件，并且默认time修改为60
                    document.getElementById("getcode").value="获取邮箱验证码";
                    time = 60;
                    clearInterval(t);
                }else{
                //这里是显示时间倒计时的时候点击不生效
                    document.getElementById("getcode").value="重新发送"+time;
                    time--;
                }
            }
        </script>
    </body>
</html>
