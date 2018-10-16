package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.Logout;

public class LogoutTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	HttpSession session = mock(HttpSession.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validLogoutTest() throws Exception {
		when(request.getSession(false)).thenReturn(session);
		
		Logout logoutTest = new Logout();
		logoutTest.doGet(request, response);
		
		verify(session).invalidate();
		verify(response).sendRedirect("Login");
	}

}
