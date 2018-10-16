package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.TaskList;

public class TaskListTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	HttpSession session = mock(HttpSession.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getSession()).thenReturn(session);
		when(session.getAttribute("email")).thenReturn("magy@sep.se");
		when(request.getRequestDispatcher("/WEB-INF/forms/taskListProd.jsp")).thenReturn(rd);
		
		TaskList taskListTest = new TaskList();
		taskListTest.doGet(request, response);
		
		verify(rd).forward(request, response);
	}
	
}
