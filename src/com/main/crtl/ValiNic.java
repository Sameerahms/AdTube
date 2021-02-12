package com.main.crtl;

public class ValiNic {
	public static boolean validateNIC(String nic) {
        
        boolean validation = false;
        boolean validation_lenth = false;
        boolean validation_last_letter = false;
        boolean validation_year = false;
        
        if(nic.length() == 10 || nic.length() == 12) {
               System.out.println("NIC lenth ok");
               validation_lenth = true;
        }
        
        if(nic.length() == 10) {
               if(nic.substring(9, 10).equalsIgnoreCase("v") || nic.substring(9, 10).equalsIgnoreCase("x")) {
                      System.out.println("NIC last letter ok");
                      validation_last_letter = true;
               }
        }
        
        if(nic.length() == 12) {
               
               System.out.println("NIC lenth : "+nic.length());
                      try {
                    	 
                      int year = Integer.parseInt(nic.substring(0, 4));
                      
                      if(year > 1900 && year < 2020) {
                            System.out.println("12 digit NIC range ok");
                            validation_year = true;
                      }
               }catch(Exception e) {
                      validation = false;
               }
               
        }else if(nic.length() == 10) {
               
               System.out.println("NIC lenth : "+nic.length());
               
               try {
                      String year_s = nic.substring(0, 2);
                      year_s = "19" + year_s;
                      
                      int year = Integer.parseInt(year_s);
                      
                      if(year > 1900) {
                            System.out.println("12 digit NIC range ok");
                            validation_year = true;
                      }
               }catch(Exception e) {
                      validation = false;
               }
               
        }
        
        if(nic.length() == 12) {
               if(validation_lenth && validation_year) {
                      System.out.println("NIC passed all validations");
                      validation = true;
               }
        }else if(nic.length() == 10){
               if(validation_lenth && validation_last_letter && validation_year) {
                      System.out.println("NIC passed all validations");
                      validation = true;
               }
        }
        
        System.out.println(validation);
        
        return validation;        
  }

}
