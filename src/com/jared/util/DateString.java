package com.jared.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateString {
	public static String getdate() {
		Date date=new Date();
		String dateString=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		return dateString;
	}
	public static void main(String[] args) {
		System.out.println(DateString.getdate());
	}
}
