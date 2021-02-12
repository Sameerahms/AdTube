package com.main;

import java.sql.SQLException;
import com.main.db.MCQAnswer;

public class Mobi {
	public static String i(String phone) throws SQLException {
		System.out.println("######### Mobi ##########");
		
		MCQAnswer mcqAnswer = new MCQAnswer();

		String pi = mcqAnswer.getPoints(phone);
		int o=Integer.parseInt(pi)*10;
		return String.valueOf(o);
		
	}
}
