package com.jared.pojo;

import java.io.Serializable;

public class Forum implements Serializable{
	private int f_id;
	private String f_title;//话题标题
	private String f_username;//话题所有者，唯一，对应user表的u_username'
	private String f_createtime;//话题创建时间
	private int f_comment;//话题讨论数量，就是当前话题的所有讨论数
	private int f_status;//话题状态：0删除，1存在
	public int getF_id() {
		return f_id;
	}
	public void setF_id(int f_id) {
		this.f_id = f_id;
	}
	public String getF_title() {
		return f_title;
	}
	public void setF_title(String f_title) {
		this.f_title = f_title;
	}
	public String getF_username() {
		return f_username;
	}
	public void setF_username(String f_username) {
		this.f_username = f_username;
	}
	public String getF_createtime() {
		return f_createtime;
	}
	public void setF_createtime(String f_createtime) {
		this.f_createtime = f_createtime;
	}
	public int getF_comment() {
		return f_comment;
	}
	public void setF_comment(int f_comment) {
		this.f_comment = f_comment;
	}
	public int getF_status() {
		return f_status;
	}
	public void setF_status(int f_status) {
		this.f_status = f_status;
	}
	@Override
	public String toString() {
		return "Forum [f_id=" + f_id + ", f_title=" + f_title + ", f_username=" + f_username + ", f_createtime="
				+ f_createtime + ", f_comment=" + f_comment + ", f_status=" + f_status + "]";
	}
	
}
