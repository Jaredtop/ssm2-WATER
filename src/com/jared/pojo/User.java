package com.jared.pojo;

import java.io.Serializable;

public class User implements Serializable{
	private int u_id;
    private String u_username;
    private String u_password;
    private String u_email;
    private String u_birthday;
    private String u_city;
    private int u_status;//用户状态。0：锁定，1：可用
    private int u_role;//用户角色。0：普通用户，1：管理员
    private String u_img;
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_birthday() {
		return u_birthday;
	}
	public void setU_birthday(String u_birthday) {
		this.u_birthday = u_birthday;
	}
	public String getU_city() {
		return u_city;
	}
	public void setU_city(String u_city) {
		this.u_city = u_city;
	}
	public int getU_status() {
		return u_status;
	}
	public void setU_status(int u_status) {
		this.u_status = u_status;
	}
	public int getU_role() {
		return u_role;
	}
	public void setU_role(int u_role) {
		this.u_role = u_role;
	}
	public String getU_img() {
		return u_img;
	}
	public void setU_img(String u_img) {
		this.u_img = u_img;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_username=" + u_username + ", u_password=" + u_password + ", u_email="
				+ u_email + ", u_birthday=" + u_birthday + ", u_city=" + u_city + ", u_status=" + u_status + ", u_role="
				+ u_role + ", u_img=" + u_img + "]";
	}
}
