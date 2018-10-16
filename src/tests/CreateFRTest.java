package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.CreateFR;

public class CreateFRTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("production");
		when(request.getParameter("project-reference")).thenReturn("123");
		when(request.getParameter("requested-amount")).thenReturn("2000");
		when(request.getParameter("reason")).thenReturn("Need to buy new cameras.");
		
		when(request.getRequestDispatcher("WEB-INF/forms/fr.jsp")).thenReturn(rd);
		
		CreateFR createFRTest = new CreateFR();
		createFRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "success");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void invalidInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("dept");
		when(request.getParameter("project-reference")).thenReturn("123qwe");
		when(request.getParameter("requested-amount")).thenReturn("Two hundred euro.");
		when(request.getParameter("reason")).thenReturn("Need to buy new cameras.");
		
		when(request.getRequestDispatcher("WEB-INF/forms/fr.jsp")).thenReturn(rd);
		
		CreateFR createFRTest = new CreateFR();
		createFRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void noDataInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("");
		when(request.getParameter("project-reference")).thenReturn("");
		when(request.getParameter("requested-amount")).thenReturn("");
		when(request.getParameter("reason")).thenReturn("");
		
		when(request.getRequestDispatcher("WEB-INF/forms/fr.jsp")).thenReturn(rd);
		
		CreateFR createFRTest = new CreateFR();
		createFRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
}
