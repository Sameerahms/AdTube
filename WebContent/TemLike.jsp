<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ page import="com.main.db.LikeDb"%>
<%@ page import="com.main.db.VideoDB" %>
<%@ page import="com.main.db.PlaylistDb" %>

<%
	String phone = session.getAttribute("Phone_num").toString();
	String like = request.getParameter("c");
	String disLike = request.getParameter("d");
	
	VideoDB videoDb = new VideoDB();
	String videoId = videoDb.ids();
	
	LikeDb likedb = new LikeDb();
	PlaylistDb playlistDb = new PlaylistDb();
	
	//update likes & dislikes
	if(videoId == "0"){
		String youtbId=playlistDb.getVideo1(phone);
		likedb.updateLike(youtbId, like);
		likedb.updateDisLike(youtbId, disLike);
	}
	
	if(videoId == "1"){
		String youtbId=playlistDb.getVideo2(phone);
		likedb.updateLike(youtbId, like);
		likedb.updateDisLike(youtbId, disLike);
	}
	
	if(videoId == "2"){
		String youtbId=playlistDb.getVideo3(phone);
		likedb.updateLike(youtbId, like);
		likedb.updateDisLike(youtbId, disLike);
	}
	
	if(videoId == "3"){
		String youtbId=playlistDb.getVideo4(phone);
		likedb.updateLike(youtbId, like);
		likedb.updateDisLike(youtbId, disLike);
	}
	
	if(videoId == "4"){
		String youtbId=playlistDb.getVideo5(phone);
		likedb.updateLike(youtbId, like);
		likedb.updateDisLike(youtbId, disLike);
	}
	
%>