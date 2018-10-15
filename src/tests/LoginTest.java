package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.Login;

public class LoginTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	HttpSession session = mock(HttpSession.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void invalidUsername_invalidPassword() throws Exception {
		when(request.getParameter("email")).thenReturn("example@email.com");
		when(request.getParameter("password")).thenReturn("qwerty");
		
		when(request.getRequestDispatcher("WEB-INF/login.jsp")).thenReturn(rd);
		
		Login loginTest = new Login();
		loginTest.doPost(request, response);
		
		verify(request).setAttribute("invalidCredentials", true);
		verify(rd).forward(request, response);
	}
	
	@Test
	public void validUsername_invalidPassword() throws Exception {
		when(request.getParameter("email")).thenReturn("janet@sep.se");
		when(request.getParameter("password")).thenReturn("qwerty");
		
		when(request.getRequestDispatcher("WEB-INF/login.jsp")).thenReturn(rd);
		
		Login loginTest = new Login();
		loginTest.doPost(request, response);
		
		verify(rd).forward(request, response);
	}
	
	@Test
	public void validUsername_validPassword() throws Exception {
		when(request.getParameter("email")).thenReturn("janet@sep.se");
		when(request.getParameter("password")).thenReturn("123456");
		
		when(request.getSession()).thenReturn(session);
		
		Login loginTest = new Login();
		loginTest.doPost(request, response);
		
		verify(response).sendRedirect("IndexSCSO");
	}

}