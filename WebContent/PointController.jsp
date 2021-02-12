<%@page import="com.main.db.MCQAnswer"%>
<%@page import="com.main.db.PlaylistDb"%>
<%

	//user total points update
	int point;
	int TotalPoints;
	
	String phone = session.getAttribute("Phone_num").toString();
	String userAns = request.getParameter("mcqAns");
	String mcqId = request.getParameter("i");
	
	PlaylistDb playlistDb = new PlaylistDb();
	MCQAnswer mcqPoints = new MCQAnswer();
	
	String dbpoints = mcqPoints.getPoints(phone);

		if(mcqId.equals("0")){			
			String uniqid = playlistDb.getVideo1(phone);
			String ans = mcqPoints.getAnswer(uniqid);

			
			if(userAns.equals(ans)){
				point = 2;
				
				TotalPoints = point + Integer.valueOf(dbpoints);
				mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
				System.out.println("TotalPoints:"+TotalPoints);
				return;
				
			}else{
				point = 1;
				
				TotalPoints = point + Integer.valueOf(dbpoints);
				mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
				System.out.println("TotalPoints:"+TotalPoints);
				return;
			}
		}

		
			if(mcqId.equals("1")){			
				String uniqid = playlistDb.getVideo2(phone);				
				String ans = mcqPoints.getAnswer(uniqid);
				
				if(userAns.equals(ans)){
					point = 2;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
					
				}else{
					point = 1;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
				}
			}
			
			
			if(mcqId.equals("2")){				
				String uniqid = playlistDb.getVideo3(phone);				
				String ans = mcqPoints.getAnswer(uniqid);

				
				if(userAns.equals(ans)){
					point = 2;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
					
				}else{
					point = 1;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
				}
			}
			
			
			if(mcqId.equals("3")){			
				String uniqid = playlistDb.getVideo4(phone);				
				String ans = mcqPoints.getAnswer(uniqid);
				
				if(userAns.equals(ans)){
					point = 2;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
					
				}else{
					point = 1;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
				}
			}
			
			
			if(mcqId.equals("4")){				
				String uniqid = playlistDb.getVideo5(phone);				
				String ans = mcqPoints.getAnswer(uniqid);
				
				if(userAns.equals(ans)){
					point = 2;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
					
				}else{
					point = 1;
					
					TotalPoints = point + Integer.valueOf(dbpoints);
					mcqPoints.updatePoints(phone, String.valueOf(TotalPoints));
					System.out.println("TotalPoints:"+TotalPoints);
					return;
				}
			}
%>