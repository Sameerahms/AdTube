package com.main.crtl;

import java.sql.SQLException;

import com.main.db.VideoDB;
import com.main.ent.VideoEnt;

public class VideoController {
public String controller(VideoEnt ent) throws SQLException {
	
	ent.setYid(VideoDB.ids());
	return ent.getYid();
	
	}

}
