package com.main;

import java.sql.SQLException;
import java.util.UUID;

public class TestRun {

	public static void main(String[] args) throws SQLException {
		String uuid=UUID.randomUUID().toString().replace("-","");
		System.out.println(uuid);
	}

}
