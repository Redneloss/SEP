package sep.filters;

import java.util.*;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class AuthServSubteam implements Filter {
	
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) 
		    throws java.io.IOException, ServletException {
    	HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
    	
    	HttpSession session = request.getSession(false);
    	if( session != null){
    		String userRole = (String) session.getAttribute("role");
    		if( userRole == null || 
    			(!userRole.equals("top_chef") && !userRole.equals("chef") &&
    			!userRole.equals("waitress") &&	!userRole.equals("senior_waitress")) ) {
    			response.sendRedirect("forbidden.jsp");
    		} else {
    			chain.doFilter(request,response);
    		}
    	} else {
    		response.sendRedirect("forbidden.jsp");
    	}
    	
   }
}
