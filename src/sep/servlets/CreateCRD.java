package sep.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class CreateCRD extends HttpServlet {
	private static final long serialVersionUID = 3367368895659890251L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";

    public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/forms/crd.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		
		String sqlNewProject = "INSERT INTO project "
		         		 + "VALUES ( NULL )";
		String sqlNewCDR = "INSERT INTO `crd` "
				         + "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmtNewProject = conn.prepareStatement(sqlNewProject, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement stmtNewCDR = conn.prepareStatement(sqlNewCDR); ) {
			
			stmtNewProject.executeUpdate();
			ResultSet rsProject = stmtNewProject.getGeneratedKeys();
			rsProject.next();
			
			String cl_record_id = request.getParameter("record-number");
			String cl_record_name = request.getParameter("client-name");
			String event_type = request.getParameter("event-type");
			String time_from = request.getParameter("start-date");
			String time_to = request.getParameter("end-date");
			int exp_attendees_num = Integer.valueOf(request.getParameter("number-of-attendees"));
			int exp_budget = Integer.valueOf(request.getParameter("expected-budget"));
			int project = rsProject.getInt(1);
			String description = request.getParameter("description");
			String decorations = request.getParameter("decorations");
			String food_drinks = request.getParameter("food-and-drinks");
			String photos_filming = request.getParameter("photos");
			String music = request.getParameter("music");
			String computer_issues = request.getParameter("computer-issues");
			String posters_artwork = request.getParameter("posters");
			String other_needs = request.getParameter("other");
			

			stmtNewCDR.setString(1, cl_record_id);
			stmtNewCDR.setString(2, cl_record_name);
			stmtNewCDR.setString(3, event_type);
			stmtNewCDR.setString(4, time_from);
			stmtNewCDR.setString(5, time_to);
			stmtNewCDR.setInt(6, exp_attendees_num);
			stmtNewCDR.setInt(7, exp_budget);
			stmtNewCDR.setInt(8, project);
			stmtNewCDR.setString(9, description);
			stmtNewCDR.setString(10, decorations);
			stmtNewCDR.setString(11, food_drinks);
			stmtNewCDR.setString(12, photos_filming);
			stmtNewCDR.setString(13, music);
			stmtNewCDR.setString(14, computer_issues);
			stmtNewCDR.setString(15, posters_artwork);
			stmtNewCDR.setString(16, other_needs);
			
	        int rows = stmtNewCDR.executeUpdate();

	        if (rows == 1) {
	        	request.setAttribute("actionState", "success");
	        }
            else {
            	request.setAttribute("actionState", "fail");
            }
	        request.getRequestDispatcher("WEB-INF/forms/crd.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("actionState", "fail");
			request.getRequestDispatcher("WEB-INF/forms/crd.jsp").forward(request, response);
		}
	}
	
}
