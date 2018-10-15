package sep.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 5177305260578193827L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("invalidCredentials", false);
		request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		
		String sql = "SELECT * "
	     		   + "FROM user "
	     		   + "WHERE email = ? "
	     		   + "AND password = ?";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmt = conn.prepareStatement(sql); ) {
			stmt.setString(1, email);
			stmt.setString(2, pass);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.isBeforeFirst()) {
	        	rs.next();
	        	String userEmail = rs.getString("email");
	        	String userName = rs.getString("name");
	        	String userRole = rs.getString("role");
	        	
	        	HttpSession session = request.getSession();  
	        	session.setAttribute("email", userEmail); 
	        	session.setAttribute("name", userName); 
	            session.setAttribute("role", userRole);
	            
	            switch (userRole){
	            	case "cso":
	            		response.sendRedirect("IndexCSO");
	            		break;
	            	case "scso":
	            		response.sendRedirect("IndexSCSO");
	            		break;
	            	case "fm":
	            		response.sendRedirect("IndexFM");
	            		break;
	            	case "am":
	            		response.sendRedirect("IndexAM");
	            		break;
	            	case "hr":
	            		response.sendRedirect("IndexHR");
	            		break;
	            	case "pm":
	            		response.sendRedirect("IndexPM");
	            		break;
	            	case "photographer":
	            		response.sendRedirect("IndexProdSubteam");
	            		break;
	            	case "audio_specialist":
	            		response.sendRedirect("IndexProdSubteam");
	            		break;
	            	case "network_engineer":
	            		response.sendRedirect("IndexProdSubteam");
	            		break;
	            	case "graphic_designer":
	            		response.sendRedirect("IndexProdSubteam");
	            		break;
	            	case "decorating_architect":
	            		response.sendRedirect("IndexProdSubteam");
	            		break;
	            	case "sm":
	            		response.sendRedirect("IndexSM");
	            		break;
	            	case "top_chef":
	            		response.sendRedirect("IndexServSubteam");
	            		break;
	            	case "chef":
	            		response.sendRedirect("IndexServSubteam");
	            		break;
	            	case "senior_waitress":
	            		response.sendRedirect("IndexServSubteam");
	            		break;
	            	case "waitress":
	            		response.sendRedirect("IndexServSubteam");
	            		break;
	            }
	        }
            else {
            	request.setAttribute("invalidCredentials", true);
            	request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
	        

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
