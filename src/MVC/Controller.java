package MVC;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Controller
 */
@WebServlet({ "/Controller", "*.do", "*.go" })
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String projectPath = "/LibSys";

		String URI = request.getRequestURI();

		URI = URI.substring(URI.lastIndexOf('/') + 1);
		URI = URI.substring(0, URI.indexOf('.') == -1 ? 0 : URI.indexOf('.'));

		switch (URI) {
		
		/* Homepage Activities */
		
				case "home":
					response.sendRedirect(projectPath + "/" + Pages.HOME);
					break;

		/* Dashboard Activties*/
							
				case "login":
					if (Model.getInstance().login(request.getParameter("username"), request.getParameter("password"))) {
						request.getSession(true).setAttribute("LibUser",
								Model.getInstance().getLibrarianDetails(request.getParameter("username")));
						response.sendRedirect(projectPath + "/" + Pages.DASHBOARD);
					}
		
					else
						response.sendRedirect(projectPath + "/" + Pages.HOME);
		
					break;
		
				case "logout":
						request.getSession().invalidate();
						response.sendRedirect(projectPath + "/" + Pages.HOME);
						break;
			

			/* Book Activities */
			
				/* Add Book */
				
					case "add_book":
						request.getRequestDispatcher(Pages.ADD_BOOK_FORM).forward(request, response);
						break;
			
					case "add_book_validate":
						request.getRequestDispatcher(Pages.ADD_BOOK_VALIDATE).forward(request, response);
						break;
			
					case "add_book_success":
						request.getRequestDispatcher(Pages.ADD_BOOK_SUCCESS).forward(request, response);
						break;
			
					case "add_book_failure":
						request.getRequestDispatcher(Pages.ADD_BOOK_FAILURE).forward(request, response);
						break;
			
				
				/* Modify Book */
						
					case "modify_book":
						request.getRequestDispatcher(Pages.MODIFY_BOOK_FORM).forward(request, response);
						break;
			
					case "modify_book_validate":
						request.getRequestDispatcher(Pages.MODIFY_BOOK_VALIDATE).forward(request, response);
						break;
			
					case "modify_book_success":
						request.getRequestDispatcher(Pages.MODIFY_BOOK_SUCCESS).forward(request, response);
						break;
			
					case "modify_book_failure":
						request.getRequestDispatcher(Pages.MODIFY_BOOK_FAILURE).forward(request, response);
						break;
			
				/* Delete Book */
						
					case "delete_book":
						request.getRequestDispatcher(Pages.DELETE_BOOK_FORM).forward(request, response);
						break;
			
					case "delete_book_validate":
						request.getRequestDispatcher(Pages.DELETE_BOOK_VALIDATE).forward(request, response);
						break;
			
					case "delete_book_success":
						request.getRequestDispatcher(Pages.DELETE_BOOK_SUCCESS).forward(request, response);
						break;
			
					case "delete_book_failure":
						request.getRequestDispatcher(Pages.DELETE_BOOK_FAILURE).forward(request, response);
						break;
						
				/* View Book */
					case "get_book":
						request.getRequestDispatcher(Pages.GET_BOOK).forward(request, response);
						break;
			
					case "get_book_modify":
						request.getRequestDispatcher(Pages.GET_BOOK_MODIFY).forward(request, response);
						break;
					
					case "get_book_session":
						request.getRequestDispatcher(Pages.GET_BOOK_SESSION).forward(request, response);
//						response.sendRedirect(projectPath + "/" + Pages.GET_BOOK_SESSION);
						break;	

	
			/* Patron Pages */
				
				
				/* Add Patron */
					case "add_patron":
						request.getRequestDispatcher(Pages.ADD_PATRON_FORM).forward(request, response);
						break;
			
					case "add_patron_validate":
						request.getRequestDispatcher(Pages.ADD_PATRON_VALIDATE).forward(request, response);
						break;
			
					case "add_patron_success":
						request.getRequestDispatcher(Pages.ADD_PATRON_SUCCESS).forward(request, response);
						break;
			
					case "add_patron_failure":
						request.getRequestDispatcher(Pages.ADD_PATRON_FAILURE).forward(request, response);
						break;
						
						
				/* Modify Patron */
					case "modify_patron":
						request.getRequestDispatcher(Pages.MODIFY_PATRON_FORM).forward(request, response);
						break;
			
					case "modify_patron_validate":
						request.getRequestDispatcher(Pages.MODIFY_PATRON_VALIDATE).forward(request, response);
						break;
			
					case "modify_patron_success":
						request.getRequestDispatcher(Pages.MODIFY_PATRON_SUCCESS).forward(request, response);
						break;
			
					case "modify_patron_failure":
						request.getRequestDispatcher(Pages.MODIFY_PATRON_FAILURE).forward(request, response);
						break;
			
						
				/* Delete Patron */
					case "delete_patron":
						request.getRequestDispatcher(Pages.DELETE_PATRON_FORM).forward(request, response);
						break;
			
					case "delete_patron_validate":
						request.getRequestDispatcher(Pages.DELETE_PATRON_VALIDATE).forward(request, response);
						break;
			
					case "delete_patron_success":
						request.getRequestDispatcher(Pages.DELETE_PATRON_SUCCESS).forward(request, response);
						break;
			
					case "delete_patron_failure":
						request.getRequestDispatcher(Pages.DELETE_PATRON_FAILURE).forward(request, response);
						break;
	
				/* View Patron */
					case "get_patron":
						request.getRequestDispatcher(Pages.GET_PATRON).forward(request, response);
						break;
						
					case "get_patron_modify":
						request.getRequestDispatcher(Pages.GET_PATRON_MODIFY).forward(request, response);
						break;

						
			/* Library Activity Pages */
						
				/* Issue Activity */
					
					case "issue":
						request.getRequestDispatcher(Pages.ISSUE_FORM).forward(request, response);
						break;
						
					case "issue_validate":
						request.getRequestDispatcher(Pages.ISSUE_VALIDATE).forward(request, response);
						break;
					
					case "issue_success":
						request.getRequestDispatcher(Pages.ISSUE_SUCCESS).forward(request, response);
						break;
						
					case "issue_failure":
						request.getRequestDispatcher(Pages.ISSUE_FAILURE).forward(request, response);
						break;
						
						
				/* Renew Activity */
					
					case "renew":
						request.getRequestDispatcher(Pages.RENEW_FORM).forward(request, response);
						break;
						
					case "renew_validate":
						request.getRequestDispatcher(Pages.RENEW_VALIDATE).forward(request, response);
						break;
					
					case "renew_success":
						request.getRequestDispatcher(Pages.RENEW_SUCCESS).forward(request, response);
						break;
						
					case "renew_failure":
						request.getRequestDispatcher(Pages.RENEW_FAILURE).forward(request, response);
						break;
						
						
						
				/* Return Activity */

					case "return":
						request.getRequestDispatcher(Pages.RETURN_FORM).forward(request, response);
						break;
						
					case "return_validate":
						request.getRequestDispatcher(Pages.RETURN_VALIDATE).forward(request, response);
						break;
					
					case "return_success":
						request.getRequestDispatcher(Pages.RETURN_SUCCESS).forward(request, response);
						break;
						
					case "return_failure":
						request.getRequestDispatcher(Pages.RETURN_FAILURE).forward(request, response);
						break;
						
				/* Transaction Activity */
						
					case "active_transactions":
						request.getRequestDispatcher(Pages.ACTIVE_TRANSACTION).forward(request, response);
						break;
						
					case "patron_transactions":
						request.getRequestDispatcher(Pages.PATRON_TRANSACTION).forward(request, response);
						break;
						
					case "patron_transactions_form":
						request.getRequestDispatcher(Pages.PATRON_TRANSACTION_FORM).forward(request, response);
						break;
						
			/* Homepage Activity */
						
					case "search_book_data":
						request.getRequestDispatcher(Pages.SEARCH_BOOK_DATA).forward(request, response);
						break;
						
			/* Settings */
						
					case "settings":
						request.getRequestDispatcher(Pages.SETTINGS_FORM).forward(request, response);
						break;
					
					case "settings_logo":
						request.getRequestDispatcher(Pages.SETTINGS_LOGO_FORM).forward(request, response);
						break;
						
					case "settings_about":
						request.getRequestDispatcher(Pages.SETTINGS_ABOUT_FORM).forward(request, response);
						break;
						
					case "settings_librarian":
						request.getRequestDispatcher(Pages.SETTINGS_LIBRRAIAN_FORM).forward(request, response);
						break;
						
					case "settings_change_logo":
						request.getRequestDispatcher(Pages.SETTINGS_LOGO_RESULT).forward(request, response);
						break;
						
					case "settings_change_about":
						request.getRequestDispatcher(Pages.SETTINGS_ABOUT_RESULT).forward(request, response);
						break;
						
					case "settings_change_librarian":
						request.getRequestDispatcher(Pages.SETTINGS_LIBRARIAN_RESULT).forward(request, response);
						break;
					
						
						
						
						
		default:
			request.getRequestDispatcher("/" + Pages.PAGE_NOT_FOUND).forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
