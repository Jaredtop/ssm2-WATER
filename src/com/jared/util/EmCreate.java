package com.jared.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class EmCreate {
		//account是发件人的邮箱 934556594@qq.com
		//password就是刚才你得到的那个授权码 fzeopgvmipfzbddi
		//code是你要发送的验证码 
		public static MimeMessage createEmail(final String account,final String password,final String code) throws Exception {
			Properties config = new Properties();
			Session session = Session.getInstance(config,new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("934556594@qq.com", password);
				}
			});
			//1 创建邮件发送对象
			MimeMessage m = new MimeMessage(session);
			//2 设置发件人xxxxx是邮件说明
			Address from = new InternetAddress("934556594@qq.com","邮箱验证码","utf-8");
			m.setFrom(from);
			//3 设置收件人xxxx是收件人的地址
			m.setRecipient(RecipientType.TO, new InternetAddress(account));
			//4 设置抄送人
			//todo
			//5 设置密送人
			//todo
			//6 设置主题
			m.setSubject("emailcode", "utf-8");
			//7 设置正文
			m.setContent("your Authentication code is "+code, "text/plain;charset=utf-8");
			//8 设置邮件发送时间
			m.setSentDate(new Date());
			//9 确认操作
			m.saveChanges();
			return m;
		}
}
