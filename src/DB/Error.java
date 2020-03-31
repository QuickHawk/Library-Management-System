package DB;

public interface Error {

	/* Error Codes */
	
	int ISSUE_SUCCESS = 0;
	int ISSUE_MAX_TRANSACTION_ERROR = 1;
	int ISSUE_BOOK_AVAILABLE_ERROR = 2;
	int ISSUE_ISSUED_ALREADY_ERROR = 3;
	int ISSUE_WRONG_PARAMETER = 4;
	
	int RENEW_SUCCESS = 0;
	int RENEW_NO_ISSUE = 1;
	int RENEW_WRONG_PARAMETER = 2;
	
	int RETURN_SUCCESS = 0;
	int RETURN_NO_ISSUE = 1;
	int RETURN_WRONG_PARAMETER = 2;
	
	// TODO :- Write String Array for Corresponding Messages for each error
	String ISSUE_ERROR_MESSAGE[] = {
		"Successfully Issued",
		"Already Issued Maximum Books",
		"Book is not available",
		"The Book is already been issued to the given Patron",
		"Wrong Input.... Check Book_ID/Patron_ID"
	};
	
	String RENEW_ERROR_MESSAGE[] = {
			"Renew Successfull",
			"No book is issued to be renewd with",
			"Wrong Input.... Check Book_ID/Patron_ID"
	};
	
	String RETURN_ERROR_MESSAGE[] = {
			"Return Successfull",
			"Book is either issued already or returned already",
			"Wrong Input.... Check Book_ID/Patron_ID"
	};
	
}
