package com.jared.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.Soundbank;

import org.apache.commons.lang.xwork.RandomStringUtils;
import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jared.pojo.Code;
import com.jared.pojo.User;
import com.jared.service.UserService;
import com.jared.util.EMsend;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	private int goId=0;
	@RequestMapping("/login")
	public String login(@RequestParam(value="username")String username,
			@RequestParam(value="password")String password,
			Model model,
			HttpSession session){
		User user=userService.login(username);
		if(user!=null) {
			if(user.getU_password().equals(password))
			{
				session.setAttribute("user", user);
				System.out.println("login log："+user.toString());
				return "redirect:/index";
			}else {
				model.addAttribute("error","用户名或密码错误！");
				return "/pages/common/error";
			}
			
		}else{
			model.addAttribute("error", "登录失败！");
			return "pages/common/error";
		}
	}
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	@RequestMapping("/userManager")
	public String toUserManager() {
		goId=0;
		return "redirect:findByPage";
	}
	
	@RequestMapping("/checkName")
	@ResponseBody
	public String checkName(@RequestParam("u_username")String username) {
		System.out.print(username+"\t\t");
		JSONObject json=JSONObject.parseObject(username);
		System.out.println("要注册的用户名："+json.getString("username"));
		User user=userService.checkName(json.getString("username"));
		return JSONObject.toJSONString(user);
	}
	
	@RequestMapping("/register")
	public String register(@RequestParam("username")String u_username,
			@RequestParam("password")String u_password,
			@RequestParam("email")String u_email,
			@RequestParam("birthday")String u_birthday,
			@RequestParam("city")String u_city) {
			
		String[] arr= {"重庆","北京","上海","浙江","湖南"};
		int city=Integer.valueOf(u_city);
		User user=new User();
		user.setU_username(u_username);
		user.setU_password(u_password);
		user.setU_email(u_email);
		user.setU_birthday(u_birthday);
		user.setU_city(arr[city]);
		user.setU_status(1);
		user.setU_role(0);
		user.setU_img("img/avatar.jpg");
		System.out.println(user.toString());
		userService.insert(user);
		return "redirect:/login";
	}
	@SuppressWarnings("unused")
	@RequestMapping("/insert")
	public String insert(User user,Model model) {
		System.out.println(user.toString());
		if(user!=null) {
			userService.insert(user);
			return "redirect:/userManager";
		}else {
			model.addAttribute("error","添加用户失败");
			return "/pages/common/error";
		}
	}
	@RequestMapping("/remove")
	public String remove(@RequestParam("u_id")int u_id){
		System.out.println(u_id);
		
		userService.remove(u_id);
		return "redirect:findByPage";
	}
	@RequestMapping("/removeMore")
	public String removeMore(@RequestParam(value="u_id",required=false)String u_id){
		System.out.println("log : 要删除用户的Id包括"+u_id);
		List<Integer> list=JSONArray.parseArray(u_id, Integer.class);
		if(list.size()!=0) {
			for(Integer i:list) {
				userService.remove(i);
			}
		}
		return "redirect:findByPage";
	}
	//查看基本资料
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "pages/admin/userInfo";
	}
	//查看用户
	@RequestMapping("/toViewUser")
	public String toViewUser(@RequestParam("u_id")String u_id,Model model){
		int id=Integer.parseInt(u_id);
		User u=userService.toViewUserById(id);
		System.out.println(u);
		model.addAttribute("u1",u);
		return "pages/admin/viewUser";
	}
	//编辑用户
	@RequestMapping("/toEditUser")
	public String toEditUser(@RequestParam("u_id")String u_id,Model model){
		int id=Integer.parseInt(u_id);
		User u=userService.toViewUserById(id);
		System.out.println(u);
		model.addAttribute("u",u);
		return "pages/admin/editUser";
	}
	//分页查询
	@RequestMapping("/findByPage")
	public String findByPage(
			@RequestParam(value="pageN",defaultValue="1",required=false) String pageNum,
			@RequestParam(value="pageSize",defaultValue="5",required=false) String pageSize,
			Model model
			) {
		ArrayList<User> list;
		int Num=Integer.parseInt(pageNum);
		int Size=Integer.parseInt(pageSize);
		PageHelper.startPage(Num,Size);//设置起始页和条数
		list=userService.findByPage();//
		PageInfo<User> page=new PageInfo<User>(list);//封装数据
		System.out.println(page.getList());
		model.addAttribute("pages",page);
		if(goId==0) {
			return "/pages/admin/userManager";
		}else {
			return "/pages/admin/userStatusRole";
		}
		
	}
	//更新资料
	@RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
	public String saveInfo(
			@RequestParam("u_id") String u_id,
			@RequestParam("username")String u_username,
			@RequestParam("password")String u_password,
			@RequestParam("email")String u_email,
			@RequestParam("birthday")String u_birthday,
			@RequestParam("city")String u_city, Model model) {
		int id=Integer.parseInt(u_id);
		System.out.println(u_id);
		System.out.println(u_username);
		System.out.println(u_password);
		System.out.println(u_email);
		System.out.println(u_birthday);
		System.out.println(u_city);
		User user=new User();
		user.setU_id(id);
		user.setU_username(u_username);
		user.setU_password(u_password);
		user.setU_email(u_email);
		user.setU_birthday(u_birthday);
		user.setU_city(u_city);
		userService.updateUser(user);
        model.addAttribute("success", "数据更新成功！");
        return "pages/common/success";
	}
	//更新头像
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(
			@RequestParam("u_id")String u_id,
			@RequestParam(value="u_img",required=false)String u_img,
			@RequestParam(value="image",required = false)MultipartFile image,
			HttpServletRequest request, Model model) {
		//生成随机名
		String name = RandomStringUtils.randomAlphanumeric(32);
        String newFileName = name + ".jpg";
        String img="image/"+newFileName;
        u_img=img;
        int id=Integer.parseInt(u_id);
        //tomcat 的webapps目录下
        //
        File newFile = new File(request.getSession().getServletContext().getRealPath("/image"), newFileName);
        newFile.getParentFile().mkdirs();
        System.out.println("log - 修改头像的u_id："+u_id);
        System.out.println("文件保存路径：" + newFile);
        User user=new User();
        user.setU_id(id);
        user.setU_img(u_img);
        //复制文件，将文件保存到服务器指定位置
        try {
			image.transferTo(newFile);
			userService.updateImg(id,u_img);
			model.addAttribute("success", "更新头像成功！下次登录生效！");
			return "pages/common/success";
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        model.addAttribute("error", "保存数据失败！");
        return "pages/common/error";
	}
	//用户状态权限
	@RequestMapping("/toUserStatusRole")
	public String toUserStatusRole() {
		goId=1;
		return "redirect:findByPage";
	}
	@RequestMapping("/setStatus")
	public String setStatus(@RequestParam("u_id")int u_id,
			@RequestParam("u_status")int u_status) {
		System.out.println("log - "+u_id+"的状态设为"+u_status);
		userService.setStatus(u_id,u_status);
		return "redirect:toUserStatusRole";
	}
	@RequestMapping("/setRole")
	public String setRole(@RequestParam("u_id")int u_id,
			@RequestParam("u_role")int u_role) {
		System.out.println("log - "+u_id+"的角色设为"+u_role);
		userService.setRole(u_id,u_role);
		return "redirect:toUserStatusRole";
	}
	@RequestMapping("/setStatusS")
	public String setStatusS(@RequestParam("u_id")String u_id,
			@RequestParam("u_status")int u_status) {
		System.out.println("log - "+u_id+"的状态设为"+u_status);
		List<Integer> list=JSONArray.parseArray(u_id, Integer.class);
		if(list.size()!=0) {
			for(Integer i:list) {
				userService.setStatus(i,u_status);
			}
		}
		
		return "redirect:toUserStatusRole";
	}
	@RequestMapping("/setRoleS")
	public String setRoleS(@RequestParam("u_id")String u_id,
			@RequestParam("u_role")int u_role) {
		System.out.println("log - "+u_id+"的角色设为"+u_role);
		List<Integer> list=JSONArray.parseArray(u_id, Integer.class);
		if(list.size()!=0) {
			for(Integer i:list) {
				userService.setRole(i, u_role);
			}
		}
		return "redirect:toUserStatusRole";
	}
	@RequestMapping("/getCode")
	@ResponseBody
	public String getCode(
			@RequestParam("email")String email
			) throws Exception {
		JSONObject jsonObject=JSONObject.parseObject(email);
		email=jsonObject.getString("email");
		System.out.println(email);
		Code code=new Code();
		String code2=EMsend.sendEmail(email);
		code.setEmail(email);
		code.setCode(code2);
		return jsonObject.toJSONString(code);
	}
}
