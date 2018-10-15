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

public class GetRR extends HttpServlet {
	private static final long serialVersionUID = 3367368895659890251L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String sql = "SELECT * "
	     		   + "FROM epr "
	     		   + "WHERE id = ? ";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmt = conn.prepareStatement(sql); ) {
			
			stmt.setString(1, request.getParameter("id"));
			
			ResultSet rs = stmt.executeQuery();
			rs.next();
			request.setAttribute("result", rs);
			request.getRequestDispatcher("WEB-INF/forms/epr.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		
		
	}
}
