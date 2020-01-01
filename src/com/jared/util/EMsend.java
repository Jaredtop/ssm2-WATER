package com.jared.util;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

public class EMsend {
	public static String sendEmail(final String account) throws Exception {
		String code=makeCode.getCode();
		String password = "fzeopgvmipfzbddi";
		MimeMessage m = EmCreate.createEmail(account, password, code);
		Session session = m.getSession();
		session.setDebug(true);
		Properties config = session.getProperties();
		config.put("mail.transport.protocol", "smtp");
		config.put("mail.smtp.host", "smtp.qq.com");
		//config.put("mail.smtp.port", "25");
		config.put("mail.smtp.auth", "true");
		//config.put("mail.smtp.ssl.enable", "false");
		Transport.send(m);
		return code;
	}
}
