package com.jared.pojo;

import java.io.Serializable;

import org.omg.CORBA.PRIVATE_MEMBER;

public class Article implements Serializable{
	private int a_id;//文章Id
    private String a_title;//文章标题
    private String a_username;//文章作者，唯一，对应user表的u_username
    private String a_article;//文章内容
    private String a_lasttime;//文章最后修改时间
    private int a_status;//文章状态 -》0-已删除 1-存在
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public String getA_username() {
		return a_username;
	}
	public void setA_username(String a_username) {
		this.a_username = a_username;
	}
	public String getA_article() {
		return a_article;
	}
	public void setA_article(String a_article) {
		this.a_article = a_article;
	}
	public String getA_lasttime() {
		return a_lasttime;
	}
	public void setA_lasttime(String a_lasttime) {
		this.a_lasttime = a_lasttime;
	}
	public int getA_status() {
		return a_status;
	}
	public void setA_status(int a_status) {
		this.a_status = a_status;
	}
	@Override
	public String toString() {
		return "Article [a_id=" + a_id + ", a_title=" + a_title + ", a_username=" + a_username + ", a_article="
				+ a_article + ", a_lasttime=" + a_lasttime + ", a_status=" + a_status + "]";
	}
}
