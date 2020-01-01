package com.jared.util;

public class makeCode {
	public static String getCode() {
		String str = "";
		for (int i = 0; i < 4; i++) {
			str += (int)Math.floor(Math.random()*10);
		}
		System.out.println(str);
		return str;
	}
}
