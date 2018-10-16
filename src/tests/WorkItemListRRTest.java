package tests;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

import sep.servlets.WorkItemListRR;

public class WorkItemListRRTest extends Mockito {

	HttpServletRequest request = mock(HttpServletRequest.class);
	HttpServletResponse response = mock(HttpServletResponse.class);
	RequestDispatcher rd = mock(RequestDispatcher.class);
	
	@Test
	public void validInputs() throws Exception {
		when(request.getRequestDispatcher("WEB-INF/forms/workItemList_rr.jsp")).thenReturn(rd);
		
		WorkItemListRR workItemsListTest = new WorkItemListRR();
		workItemsListTest.doGet(request, response);
		
		verify(rd).forward(request, response);
	}
	
}
