package com.jared.pojo;

import java.io.Serializable;

public class Comment implements Serializable{
	private int c_id;
	private String c_username;//评论人
	private String c_comment;//评论内容
	private String c_createtime;//评论时间
	private int c_status;//文章状态：0已删除 1存在
	private int c_type;//0文章 1话题
	private int a_id;//文章Id或话题Id
	
	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public String getC_username() {
		return c_username;
	}

	public void setC_username(String c_username) {
		this.c_username = c_username;
	}

	public String getC_comment() {
		return c_comment;
	}

	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}

	public String getC_createtime() {
		return c_createtime;
	}

	public void setC_createtime(String c_createtime) {
		this.c_createtime = c_createtime;
	}

	public int getC_status() {
		return c_status;
	}

	public void setC_status(int c_status) {
		this.c_status = c_status;
	}
	
	public int getC_type() {
		return c_type;
	}

	public void setC_type(int c_type) {
		this.c_type = c_type;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	@Override
	public String toString() {
		return "Comment [c_id=" + c_id + ", c_username=" + c_username + ", c_comment=" + c_comment + ", c_createtime="
				+ c_createtime + ", c_status=" + c_status + ", c_type=" + c_type + ", a_id=" + a_id + "]";
	}
	
	
}
