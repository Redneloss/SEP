package sep.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.http.*;

public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String HTML_START="<html><body>";
	public static final String HTML_END="</body></html>";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String servletPath = request.getServletPath();
		switch(servletPath) {
			case "/IndexCSO":
				request.getRequestDispatcher("WEB-INF/index/index_CSO.jsp").forward(request, response);
				break;
			case "/IndexSCSO":
				request.getRequestDispatcher("WEB-INF/index/index_SCSO.jsp").forward(request, response);
				break;
			case "/IndexFM":
				request.getRequestDispatcher("WEB-INF/index/index_FM.jsp").forward(request, response);
				break;
			case "/IndexAM":
				request.getRequestDispatcher("WEB-INF/index/index_AM.jsp").forward(request, response);
				break;
			case "/IndexHR":
				request.getRequestDispatcher("WEB-INF/index/index_HR.jsp").forward(request, response);
				break;
			case "/IndexPM":
				request.getRequestDispatcher("WEB-INF/index/index_PM.jsp").forward(request, response);
				break;
			case "/IndexProdSubteam":
				request.getRequestDispatcher("WEB-INF/index/index_ProdSubteam.jsp").forward(request, response);
				break;
			case "/IndexSM":
				request.getRequestDispatcher("WEB-INF/index/index_SM.jsp").forward(request, response);
				break;
			case "/IndexServSubteam":
				request.getRequestDispatcher("WEB-INF/index/index_ServSubteam.jsp").forward(request, response);
				break;
		}
		
	}
}
