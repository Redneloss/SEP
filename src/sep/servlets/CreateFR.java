package sep.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class CreateFR extends HttpServlet {
	private static final long serialVersionUID = 3367368895659890251L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/forms/fr.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		
		String sql = "INSERT INTO financial_request VALUES "
				   + "(NULL, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmt = conn.prepareStatement(sql); ) {
			
			String department = request.getParameter("department");
			int project = Integer.valueOf(request.getParameter("project-reference"));
			int requested_amount = Integer.valueOf(request.getParameter("requested-amount"));
			String reason = request.getParameter("reason");
			String status = "new";
			
			stmt.setString(1, department);
			stmt.setInt(2, project);
			stmt.setInt(3, requested_amount);
			stmt.setString(4, reason);
			stmt.setString(5, status);
			
	        int rows = stmt.executeUpdate();

	        if (rows == 1) {
	        	request.setAttribute("actionState", "success");
	        }
            else {
            	request.setAttribute("actionState", "fail");
            }
	        request.getRequestDispatcher("WEB-INF/forms/fr.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("actionState", "fail");
			request.getRequestDispatcher("WEB-INF/forms/fr.jsp").forward(request, response);
		}
	}
	
}
