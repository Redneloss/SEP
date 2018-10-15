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

public class CreateEPR extends HttpServlet {
	private static final long serialVersionUID = 3367368895659890251L;
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
	static final String DB_URL="jdbc:mysql://localhost:3306/sep";
	static final String USER = "root";
    static final String PASS = "";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/forms/epr.jsp").forward(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	
		
		String sql = "INSERT INTO `epr` "
				   + "VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
			PreparedStatement stmt = conn.prepareStatement(sql); ) {
			
			String status = "new";
			String cl_record_id = request.getParameter("record-number");
			String cl_record_name = request.getParameter("client-name");
			String event_type = request.getParameter("event-type");
			String time_from = request.getParameter("start-date");
			String time_to = request.getParameter("end-date");
			int exp_attendees_num = Integer.valueOf(request.getParameter("number-of-attendees"));
			boolean decorations_b = false;
			if (request.getParameter("decorations") != null){
				decorations_b = true;
			}
			boolean food_drinks_b = false;
			if (request.getParameter("food-and-drinks") != null){
				food_drinks_b = true;
			}
			boolean photos_filming_b = false;
			if (request.getParameter("photos") != null){
				photos_filming_b = true;
			}
			boolean music_b = false;
			if (request.getParameter("music") != null){
				music_b = true;
			}
			boolean posters_artwork_b = false;
			if (request.getParameter("posters") != null){
				posters_artwork_b = true;
			}
			int exp_budget = Integer.valueOf(request.getParameter("expected-budget"));
			String fm_comment = "";

			stmt.setString(1, status);
			stmt.setString(2, cl_record_id);
			stmt.setString(3, cl_record_name);
			stmt.setString(4, event_type);
			stmt.setString(5, time_from);
			stmt.setString(6, time_to);
			stmt.setInt(7, exp_attendees_num);
			stmt.setBoolean(8, decorations_b);
			stmt.setBoolean(9, food_drinks_b);
			stmt.setBoolean(10, photos_filming_b);
			stmt.setBoolean(11, music_b);
			stmt.setBoolean(12, posters_artwork_b);
			stmt.setInt(13, exp_budget);
			stmt.setString(14, fm_comment);
	        int rows = stmt.executeUpdate();

	        if (rows == 1) {
	        	request.setAttribute("actionState", "success");
	        }
            else {
            	request.setAttribute("actionState", "fail");
            }
	        request.getRequestDispatcher("WEB-INF/forms/epr.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("actionState", "fail");
			request.getRequestDispatcher("WEB-INF/forms/epr.jsp").forward(request, response);
		}
	}
	
}
