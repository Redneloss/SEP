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
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class CreateTaskPM extends HttpServlet {
	private static final long serialVersionUID = 3367368895659890251L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";
    
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
    	
		selectAndSet(request);
    	request.getRequestDispatcher("WEB-INF/forms/prod_dept.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		
		selectAndSet(request);
		
		String sqlCreateTask = "INSERT INTO task VALUES "
				   			 + "(NULL, ?, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmt = conn.prepareStatement(sqlCreateTask); ) {
			
			String project = request.getParameter("project-reference");
			String description = request.getParameter("task-description");
			String assigned_to = request.getParameter("assign-to");
			String priority = request.getParameter("priority");
			String sender = (String) request.getSession(false).getAttribute("email");
			String status = "new";
			
			stmt.setString(1, project);
			stmt.setString(2, description);
			stmt.setString(3, assigned_to);
			stmt.setString(4, priority);
			stmt.setString(5, sender);
			stmt.setString(6, status);
			
	        int rows = stmt.executeUpdate();

	        if (rows == 1) {
	        	request.setAttribute("actionState", "success");
	        }
            else {
            	request.setAttribute("actionState", "fail");
            }
	        request.getRequestDispatcher("WEB-INF/forms/prod_dept.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("actionState", "fail");
			request.getRequestDispatcher("/WEB-INF/forms/prod_dept.jsp").forward(request, response);
		}
	}
	
	private void selectAndSet(HttpServletRequest request){
		String sqlGetProjects = "SELECT *"
	              + "FROM project";
		String sqlGetPhotographers = "SELECT * "
	          	   + "FROM user "
	          	   + "WHERE role = 'photographer'";
		String sqlGetDecArchitects = "SELECT * "
					         	   + "FROM user "
					         	   + "WHERE role = 'decorating_architect'";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmtProjects = conn.prepareStatement(sqlGetProjects);
			PreparedStatement stmtPhotographers = conn.prepareStatement(sqlGetPhotographers);
			PreparedStatement stmtDecArchitects = conn.prepareStatement(sqlGetDecArchitects);) {
					
			ResultSet rsProjects = stmtProjects.executeQuery();
			ArrayList<String> projects = new ArrayList<String>();
			while(rsProjects.next()){
				projects.add(rsProjects.getString("id"));
			}
			request.setAttribute("rsProjects", projects);
			
			ResultSet rsDecArchitects = stmtDecArchitects.executeQuery();
			ArrayList<ArrayList<String>> decArchitects = new ArrayList<ArrayList<String>>();
			while(rsDecArchitects.next()){
				ArrayList<String> decArchitect = new ArrayList<String>();
				decArchitect.add(rsDecArchitects.getString("email"));
				decArchitect.add(rsDecArchitects.getString("name"));
				decArchitects.add(decArchitect);
			}
			request.setAttribute("rsDecArchitects", decArchitects);
			
//			ResultSet rsPhotographers = stmtPhotographers.executeQuery();
//			request.setAttribute("rsPhotographers", rsPhotographers);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
