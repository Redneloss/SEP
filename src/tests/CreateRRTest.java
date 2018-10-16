package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.CreateRR;

public class CreateRRTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("Production");
		when(request.getParameter("contract")).thenReturn("full_time");
		when(request.getParameter("years-of-experience")).thenReturn("2");
		when(request.getParameter("job-title")).thenReturn("Graphic Designer");
		when(request.getParameter("job-description")).thenReturn("Looking for Graphics Designer!");
		
		when(request.getRequestDispatcher("WEB-INF/forms/rr.jsp")).thenReturn(rd);
		
		CreateRR createRRTest = new CreateRR();
		createRRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "success");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void invalidInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("dept");
		when(request.getParameter("contract")).thenReturn("full-time");
		when(request.getParameter("years-of-experience")).thenReturn("year");
		when(request.getParameter("job-title")).thenReturn("Graphic Designer");
		when(request.getParameter("job-description")).thenReturn("Looking for Graphics Designer!");
		
		when(request.getRequestDispatcher("WEB-INF/forms/rr.jsp")).thenReturn(rd);
		
		CreateRR createRRTest = new CreateRR();
		createRRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void noDataInputs() throws Exception {
		when(request.getParameter("department")).thenReturn("");
		when(request.getParameter("contract")).thenReturn("");
		when(request.getParameter("years-of-experience")).thenReturn("");
		when(request.getParameter("job-title")).thenReturn("");
		when(request.getParameter("job-description")).thenReturn("");
		
		when(request.getRequestDispatcher("WEB-INF/forms/rr.jsp")).thenReturn(rd);
		
		CreateRR createRRTest = new CreateRR();
		createRRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
}
