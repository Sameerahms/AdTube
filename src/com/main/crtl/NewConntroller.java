package com.main.crtl;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.db.DbController;

public class NewConntroller {
	public String fOs(HttpServletRequest request, HttpServletResponse response) {

		String agent = request.getHeader ("user-agent");
		
		if(agent.contains("Android")){
			agent="ANDROID";
			 return agent;
		}
		if(agent.contains("Windows")){
			agent="Windows";
			 return agent;
			
		}if(agent.contains("IOS")){
			agent="IOS";
			 return agent;
			
		}else {
			agent="others";
		return agent;
		}
	}

public static String rsend(String phone) {
	
	DbController dbController = new DbController();
	
	try {
		return OTPsend.sendSMS(phone,"otp"+dbController.getOTP(phone));
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return "resend Fail";
	}
	
}
}
