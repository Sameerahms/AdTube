<%@page import="com.main.db.ReplayDb"%>
<%@page import="com.main.db.PlaylistDb"%>

<%		
	String phone = session.getAttribute("Phone_num").toString();
	String i = request.getParameter("m");
	int reCount;
	
	ReplayDb replayDb = new ReplayDb();
	PlaylistDb playlistDb = new PlaylistDb();

		if(i.equals("0")){
			
			String yid = playlistDb.getVideo1(phone);
			reCount = replayDb.getReCount(phone, yid);			
			 
			if(reCount == 0){
				reCount ++;
				replayDb.addReplay(phone, yid, reCount);
			}else{
				reCount ++;
				replayDb.updateReCount(phone, yid, reCount);
			}
		}
		
		
		if(i.equals("1")){
				
			String yid = playlistDb.getVideo2(phone);
			reCount = replayDb.getReCount(phone, yid);

			 if(reCount == 0){
				 reCount ++;
				 replayDb.addReplay(phone, yid, reCount);
			 }else{
				 reCount ++;
				 replayDb.updateReCount(phone, yid, reCount);
			 }
 			
		}
		
						
		if(i.equals("2")){
				
			String yid = playlistDb.getVideo3(phone);
			reCount = replayDb.getReCount(phone, yid);
			
			if(reCount == 0){
				reCount ++;
				replayDb.addReplay(phone, yid, reCount);
			}else{
				reCount ++;
				replayDb.updateReCount(phone, yid, reCount);
			}
		}
			
		
		if(i.equals("3")){
				
			String yid = playlistDb.getVideo4(phone);
			reCount = replayDb.getReCount(phone, yid);
			
			if(reCount == 0){
				reCount ++;
				replayDb.addReplay(phone, yid, reCount);
			}else{
				reCount ++;
				replayDb.updateReCount(phone, yid, reCount);
			}
		}
			
			
		if(i.equals("4")){
			
			String yid = playlistDb.getVideo5(phone);
			reCount = replayDb.getReCount(phone, yid);
			 
			if(reCount ==  0){
				reCount ++;
				replayDb.addReplay(phone, yid, reCount);
			}else{
				reCount ++;
				replayDb.updateReCount(phone, yid, reCount);
			}

		}
%>