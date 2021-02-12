package com.main;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpHead extends HttpServlet{
	private static java.util.regex.Pattern PRIVATE_ADDRESS_PATTERN = java.util.regex.Pattern.compile(
		      "(^127\\.)|(^192\\.168\\.)|(^10\\.)|(^172\\.1[6-9]\\.)|(^172\\.2[0-9]\\.)|(^172\\.3[0-1]\\.)|(^::1$)|(^[fF][cCdD])",
		      java.util.regex.Pattern.CANON_EQ);
		  // CHECKSTYLE:ON
	public String fOs(HttpServletRequest request, HttpServletResponse response) {
		String agent = request.getHeader ("user-agent");
		if(agent.contains("Android")){
			agent="ANDROID";
			 return agent;
		}
		if(agent.contains("Windows")){
			agent="Windows";
			 return agent;
			
		}if(agent.contains("iPhone")){
			agent="iOS";
			 return agent;
		}
		
		if(agent.contains("iPad")){
			agent="iOS";
			 return agent;			
		}
		else {
			agent="others";
		return agent;
		}
	}
	
	public String ips(HttpServletRequest request, HttpServletResponse response) {
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP"); 
            return ip;
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
            return ip;
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
            return ip;
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
            return ip;
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
            return ip;
        }
        return ip;
	}
	public String brow(HttpServletRequest request, HttpServletResponse response) {
		String  browserDetails  =   request.getHeader("User-Agent");
        String  userAgent       =   browserDetails;
        String  user            =   userAgent.toLowerCase();

        String browser = "";
		//===============Browser===========================
        if (user.contains("msie"))
        {
            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
            return browser;
        } else if (user.contains("safari") && user.contains("version"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            return browser;
        } else if ( user.contains("opr") || user.contains("opera"))
        {
            if(user.contains("opera"))
                
            browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
            else if(user.contains("opr"))
                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
            return browser;
        
        
        } else if (user.contains("chrome"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
       
            return browser;
        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
        {
            //browser=(userAgent.substring(userAgent.indexOf("MSIE")).split(" ")[0]).replace("/", "-");
          
        	browser = "Netscape-?";
        	 return browser;
        } else if (user.contains("firefox"))
        {
            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
            return browser;
        
        } else if(user.contains("rv"))
        {
            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
        } else
        {
            browser = "UnKnown, More-Info: "+userAgent;
            return browser;
        }
		return browser;
        
	}		
	public String ipo(HttpServletRequest request, HttpServletResponse response) {
		String ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");

		if (ipAddress == null) {
		    ipAddress = request.getRemoteAddr();
		    return ipAddress;
		}
		  return ipAddress;
	}	
	
	 public static String getFrom(HttpServletRequest request, boolean filterPrivateAddresses) {
		    String ip = request.getRemoteAddr();

		    String headerClientIp = request.getHeader("Client-IP");
		    String headerXForwardedFor = request.getHeader("X-Forwarded-For");
		    if (org.apache.commons.lang3.StringUtils.isEmpty(ip) && org.apache.commons.lang3.StringUtils.isNotEmpty(headerClientIp)) {
		      ip = headerClientIp;
		    } else if (org.apache.commons.lang3.StringUtils.isNotEmpty(headerXForwardedFor)) {
		      ip = headerXForwardedFor;
		    }
		    if (filterPrivateAddresses && isPrivateOrLocalAddress(ip)) {
		      return org.apache.commons.lang3.StringUtils.EMPTY;
		    } else {
		      return ip;
		    }
		  }
	 
	  private static boolean isPrivateOrLocalAddress(String address) {
		    java.util.regex.Matcher regexMatcher = PRIVATE_ADDRESS_PATTERN.matcher(address);
		    return regexMatcher.matches();
		    
		    
	  }
}
