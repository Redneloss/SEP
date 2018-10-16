package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.CreateTaskPM;

public class CreateTaskPMTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	HttpSession session = mock(HttpSession.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getParameter("project-reference")).thenReturn("1");
		when(request.getParameter("task-description")).thenReturn("Task description.");
		when(request.getParameter("assign-to")).thenReturn("magy@sep.se");
		when(request.getParameter("priority")).thenReturn("Low");
		when(request.getSession(false)).thenReturn(session);
		when(session.getAttribute("email")).thenReturn("jack@sep.se");
		
		when(request.getRequestDispatcher("/WEB-INF/forms/prod_dept.jsp")).thenReturn(rd);
		
		CreateTaskPM createTaskTest = new CreateTaskPM();
		createTaskTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "success");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void invalidInputs() throws Exception {
		when(request.getParameter("project-reference")).thenReturn("123qwe");
		when(request.getParameter("task-description")).thenReturn("Task description.");
		when(request.getParameter("assign-to")).thenReturn("Magy1");
		when(request.getParameter("priority")).thenReturn("high");
		
		when(request.getRequestDispatcher("/WEB-INF/forms/prod_dept.jsp")).thenReturn(rd);
		
		CreateTaskPM createTaskTest = new CreateTaskPM();
		createTaskTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
	@Test
	public void noDataInputs() throws Exception {
		when(request.getParameter("project-reference")).thenReturn("");
		when(request.getParameter("task-description")).thenReturn("");
		when(request.getParameter("assign-to")).thenReturn("");
		when(request.getParameter("priority")).thenReturn("");
		
		when(request.getRequestDispatcher("/WEB-INF/forms/prod_dept.jsp")).thenReturn(rd);
		
		CreateTaskPM createTaskTest = new CreateTaskPM();
		createTaskTest.doPost(request, response);
		
		verify(request).setAttribute("actionState", "fail");
		verify(rd).forward(request, response);
	}
	
}
