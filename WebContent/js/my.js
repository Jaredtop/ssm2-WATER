layui.use('element', function(){
	     var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	     //监听导航点击
	     element.on('nav(demo)', function(elem){
	     //console.log(elem)
	     layer.msg(elem.text());
	     });
	});
layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form
    ,layer = layui.layer
    ,layedit = layui.layedit
    ,laydate = layui.laydate;
    //日期
    //常规用法
    laydate.render({
        elem: '#test1'
    });
  })
$(document).ready(function () {
    $('ul.nav > li').click(function (e) {
        //e.preventDefault();    加上这句则导航的<a>标签会失效
        $('ul.nav > li').removeClass('layui-this');
        $(this).addClass('layui-this');
    });
});


