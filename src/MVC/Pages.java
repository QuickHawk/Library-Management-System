package MVC;

public interface Pages {

	String DASHBOARD = "Dashboard.jsp";
	String HOME = "Homepage.jsp";
	
	String LOGO = "WebContent/Documents/Logo.txt";	
	String SEARCH_BOOK_DATA = "Pages/Homepage/Book Search/SearchBookData.jsp";
	
	String PAGE_NOT_FOUND = "PageNotFound.jsp";
	
		/*
	 	* ---------------------------Book Pages---------------------------------------------------
	 	*/
	
		String ADD_BOOK_FORM = "Pages/Dashboard/Book/AddBook/Form.jsp";
		String ADD_BOOK_VALIDATE = "Pages/Dashboard/Book/AddBook/Validate.jsp";
		String ADD_BOOK_SUCCESS = "Pages/Dashboard/Book/AddBook/Success.jsp";
		String ADD_BOOK_FAILURE = "Pages/Dashboard/Book/AddBook/Failure.jsp";
		
		String MODIFY_BOOK_FORM = "Pages/Dashboard/Book/ModifyBook/Form.jsp";
		String MODIFY_BOOK_VALIDATE = "Pages/Dashboard/Book/ModifyBook/Validate.jsp";
		String MODIFY_BOOK_SUCCESS = "Pages/Dashboard/Book/ModifyBook/Success.jsp";
		String MODIFY_BOOK_FAILURE = "Pages/Dashboard/Book/ModifyBook/Failure.jsp";
		
		String DELETE_BOOK_FORM = "Pages/Dashboard/Book/DeleteBook/Form.jsp";
		String DELETE_BOOK_VALIDATE = "Pages/Dashboard/Book/DeleteBook/Validate.jsp";
		String DELETE_BOOK_SUCCESS = "Pages/Dashboard/Book/DeleteBook/Success.jsp";
		String DELETE_BOOK_FAILURE = "Pages/Dashboard/Book/DeleteBook/Failure.jsp";
		
		String GET_BOOK = "Pages/Dashboard/Book/ViewBook/GetBook.jsp";
		String GET_BOOK_MODIFY = "Pages/Dashboard/Book/ViewBook/GetBookModify.jsp";
		String GET_BOOK_SESSION = "Pages/Dashboard/Book/ViewBook/GetBookSession.jsp";
		String VIEW_BOOK = "Pages/Dashboard/Book/ViewBook/View.jsp";

		/*
		 * ---------------------------Patron Pages---------------------------------------------------
		 */
		
		String ADD_PATRON_FORM = "Pages/Dashboard/Patron/AddPatron/Form.jsp";
		String ADD_PATRON_VALIDATE = "Pages/Dashboard/Patron/AddPatron/Validate.jsp";
		String ADD_PATRON_SUCCESS = "Pages/Dashboard/Patron/AddPatron/Success.jsp";
		String ADD_PATRON_FAILURE = "Pages/Dashboard/Patron/AddPatron/Failure.jsp";
		
		String MODIFY_PATRON_FORM = "Pages/Dashboard/Patron/ModifyPatron/Form.jsp";
		String MODIFY_PATRON_VALIDATE = "Pages/Dashboard/Patron/ModifyPatron/Validate.jsp";
		String MODIFY_PATRON_SUCCESS = "Pages/Dashboard/Patron/ModifyPatron/Success.jsp";
		String MODIFY_PATRON_FAILURE = "Pages/Dashboard/Patron/ModifyPatron/Failure.jsp";
		
		String DELETE_PATRON_FORM = "Pages/Dashboard/Patron/DeletePatron/Form.jsp";
		String DELETE_PATRON_VALIDATE = "Pages/Dashboard/Patron/DeletePatron/Validate.jsp";
		String DELETE_PATRON_SUCCESS = "Pages/Dashboard/Patron/DeletePatron/Success.jsp";
		String DELETE_PATRON_FAILURE = "Pages/Dashboard/Patron/DeletePatron/Failure.jsp";
		
		String GET_PATRON = "Pages/Dashboard/Patron/ViewPatron/GetPatron.jsp";
		String GET_PATRON_MODIFY = "Pages/Dashboard/Patron/ViewPatron/GetPatronModify.jsp";
		
		/*
		 * ---------------------------Library Activity Pages-------------------------------------------
		 */
		
		String ISSUE_FORM = "Pages/Dashboard/Library/Issue/Form.jsp";
		String ISSUE_VALIDATE = "Pages/Dashboard/Library/Issue/Validate.jsp";
		String ISSUE_SUCCESS= "Pages/Dashboard/Library/Issue/Success.jsp";
		String ISSUE_FAILURE= "Pages/Dashboard/Library/Issue/Failure.jsp";
		
		String RENEW_FORM = "Pages/Dashboard/Library/Renew/Form.jsp";
		String RENEW_VALIDATE = "Pages/Dashboard/Library/Renew/Validate.jsp";
		String RENEW_SUCCESS= "Pages/Dashboard/Library/Renew/Success.jsp";
		String RENEW_FAILURE= "Pages/Dashboard/Library/Renew/Failure.jsp";
		
		String RETURN_FORM = "Pages/Dashboard/Library/Return/Form.jsp";
		String RETURN_VALIDATE = "Pages/Dashboard/Library/Return/Validate.jsp";
		String RETURN_SUCCESS= "Pages/Dashboard/Library/Return/Success.jsp";
		String RETURN_FAILURE= "Pages/Dashboard/Library/Return/Failure.jsp";
		
		String ACTIVE_TRANSACTION = "Pages/Dashboard/Library/Transactions/Active/Active.jsp";
		String PATRON_TRANSACTION = "Pages/Dashboard/Library/Transactions/Patron/Patron.jsp";
		String PATRON_TRANSACTION_FORM = "Pages/Dashboard/Library/Transactions/Patron/Form.jsp";
		
		/*
		 * ---------------------------Settings Pages----------------------------------------------------------
		 */
		
		String SETTINGS_FORM = "Pages/Dashboard/Settings/Form.jsp";
		
		String SETTINGS_LOGO_FORM = "Pages/Dashboard/Settings/Logo/Form.jsp";
		String SETTINGS_LOGO_RESULT = "Pages/Dashboard/Settings/Logo/Result.jsp";

		String SETTINGS_ABOUT_FORM = "Pages/Dashboard/Settings/About/Form.jsp";
		String SETTINGS_ABOUT_RESULT = "Pages/Dashboard/Settings/About/Result.jsp";

		String SETTINGS_LIBRRAIAN_FORM = "Pages/Dashboard/Settings/Librarian/Form.jsp";
		String SETTINGS_LIBRARIAN_RESULT = "Pages/Dashboard/Settings/Librarian/Result.jsp";
}

