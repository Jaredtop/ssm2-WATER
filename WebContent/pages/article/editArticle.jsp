<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    %>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="<%=basePath %>/layui/css/layui.css"
    media="all">
<link rel="stylesheet" href="<%=basePath %>/css/bootstrap.min.css"
    media="all">
<link rel="stylesheet" href="<%=basePath %>/editormd/css/editormd.css"
    media="all">

</head>
<body>
    <div class="layui-fluid">
        <fieldset class="layui-elem-field layui-field-title"
            style="margin-top: 30px;">
            <legend>修改文章</legend>
        </fieldset>
        <div class="layui-col-md11 layui-col-md-offset1">
            <label class="layui-form-label" style="font-size:17px;width: 10%;">文章标题</label>
            <div class="layui-input-inline">
                <input type="text" id="a_title" name="a_title" lay-verify="required"
                    lay-reqtext="文章标题是必填项，岂能为空？" placeholder="请输入标题" autocomplete="off"
                    class="layui-input" value="${article.a_title }">
            </div>
            <br>
            <br>
            <div style="font-size:17px;padding:5px;">文章内容</div>
            <div id="layout" class="editor">
                <div id="editormd">
                    <textarea>${article.a_article }</textarea>
                </div>
            </div>
            <div class="layui-form-item layui-col-md-offset1">
                <div class="layui-input-inline">
                    <button type="button" id="saveBtn" class="layui-btn"
                        lay-submit="" lay-filter="demo1">保存文章</button>
                    <button type="button" id="cancelBtn" class="layui-btn layui-btn-primary">取消</button>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>
    <script src="<%=basePath %>/layui/layui.js" charset="utf-8"></script>
    <script src="<%=basePath %>/js/jquery.min.js" charset="utf-8"></script>
    <script src="<%=basePath %>/js/jquery.timers.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>/js/my.js" type="text/javascript"></script>
    <script src="<%=basePath %>/editormd/editormd.js" charset="utf-8"></script>
    <script type="text/javascript">
       var testEditor;
        $(function(){
            testEditor = editormd("editormd", {
                 placeholder:'本编辑器支持Markdown编辑，左边编写，右边预览',  //默认显示的文字，这里就不解释了
                 width: "100%",
                 height: 640,
                 syncScrolling: "single",  
                 path: '<%=basePath %>/editormd/lib/',   //你的path路径（原资源文件中lib包在我们项目中所放的位置）
                 theme: "dark",//工具栏主题
                 previewTheme: "dark",//预览主题
                 editorTheme: "pastel-on-dark",//编辑主题
                 saveHTMLToTextarea: true,
                 emoji: false,
                 taskList: true, 
                 tocm: true,         // Using [TOCM]
                 tex: true,                   // 开启科学公式TeX语言支持，默认关闭
                 flowChart: true,             // 开启流程图支持，默认关闭
                 sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭,
                 toolbarIcons : function() {  //自定义工具栏，后面有详细介绍
                     return editormd.toolbarModes['simple']; // full, simple, mini
                  },
            });
        });
        </script>
    <script type="text/javascript">
        $("#saveBtn").click(function(){
            var a_id=${article.a_id};
            var a_title=document.getElementById("a_title").value;
            var a_article=testEditor.getMarkdown();
            $.ajax({
                url:'<%=basePath%>/article/save',
                type : 'post',
                data : {
                    a_id : a_id,
                    a_title : a_title,
                    a_article : a_article
                },
                success : function(data) {
                    layer.open({
                        title : '提示信息',
                        icon:1,
                        content : '保存文章成功！',
                        time:1000
                    })
                    $("body").oneTime('1s',function(){
                        $("body").html(data);
                    });
                },
                error : function() {
                    layer.open({
                        title : '提示信息',
                        content : '保存文章失败!'
                    })
                }

            })
        });
        $("#cancelBtn").click(function(){
            $.ajax({
                url:'<%=basePath%>/article/toArticleManager',
                type : 'post',
                success : function(data) {
                    $("body").html(data);
                },
            })
        });
    </script>
</body>
</html>