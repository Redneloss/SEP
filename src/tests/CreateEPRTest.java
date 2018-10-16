package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.CreateEPR;

public class CreateEPRTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getParameter("record-number")).thenReturn("123");
		when(request.getParameter("client-name")).thenReturn("John");
		when(request.getParameter("event-type")).thenReturn("Workshop");
		when(request.getParameter("start-date")).thenReturn("2000-01-01");
		when(request.getParameter("end-date")).thenReturn("2000-01-01");
		when(request.getParameter("number-of-attendees")).thenReturn("1");
		when(request.getParameter("expected-budget")).thenReturn("1");
		
		when(request.getRequestDispatcher("WEB-INF/forms/epr.jsp")).thenReturn(rd);
		
		CreateEPR createEPRTest = new CreateEPR();
		createEPRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "success");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void invalidInputs() throws Exception {
		when(request.getParameter("record-number")).thenReturn("string");
		when(request.getParameter("client-name")).thenReturn("name");
		when(request.getParameter("event-type")).thenReturn("event");
		when(request.getParameter("start-date")).thenReturn("date");
		when(request.getParameter("end-date")).thenReturn("date");
		when(request.getParameter("number-of-attendees")).thenReturn("number");
		when(request.getParameter("expected-budget")).thenReturn("budget");
		
		when(request.getRequestDispatcher("WEB-INF/forms/epr.jsp")).thenReturn(rd);
		
		CreateEPR createEPRTest = new CreateEPR();
		createEPRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void noDataInputs() throws Exception {
		when(request.getParameter("record-number")).thenReturn("");
		when(request.getParameter("client-name")).thenReturn("");
		when(request.getParameter("event-type")).thenReturn("");
		when(request.getParameter("start-date")).thenReturn("");
		when(request.getParameter("end-date")).thenReturn("");
		when(request.getParameter("number-of-attendees")).thenReturn("");
		when(request.getParameter("expected-budget")).thenReturn("");
		
		when(request.getRequestDispatcher("WEB-INF/forms/epr.jsp")).thenReturn(rd);
		
		CreateEPR createEPRTest = new CreateEPR();
		createEPRTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
}
