package com.kh.tamnaji.common.template;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderIdCreate {
	
	public static String getOrderIdCreate() {
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int) (Math.random()*90000 + 10000);
		
		return currentTime+ranNum;
	}
}
