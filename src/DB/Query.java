package DB;

public interface Query {
	/* Query Strings */
	
	String CHANGE_LIBRARIAN = "call `ChangeLibrarian`(?, ?, ?)";
	String LOGIN = "select `Login`(?, ?)";
	
	String ADD_PATRON = "call `AddPatron`(?, ?, ?, ?)";
	String MODIFY_PATRON = "call `ModifyPatron`(?, ?, ?, ?, ?)";
	String DELETE_PATRON = "call `DeletePatron`(?)";
	
	String ADD_BOOK = "call `AddBook`(?, ?, ?, ?, ?, ?, ?, ?)";
	String MODIFY_BOOK = "call `ModifyBook`(?, ?, ?, ?, ?, ?, ?, ?, ?)";
	String DELETE_BOOK = "call `DeleteBook`(?)";
	
	String ISSUE_BOOK = "select `Issue`(?, ?)";
	String RENEW_BOOK = "select `Renew`(?, ?)";
	String RETURN_BOOK = "select `Return`(?, ?)";
	
	String GET_BOOK_DETAILS = "call `GetBook`(?)";
	String GET_PATRON_DETAILS = "call `GetPatron`(?)";
	String GET_LIBRARIAN_DETAILS = "select `ID`, `Name` from " + Params.LIBRARIAN_TABLE + " where `ID` = ?";
	
	String SEARCH_BOOKS = "call `Search`(?)";
	String VIEW_PATRON_TRANSACTIONS = "select * from " + Params.PATRON_TRANSACTION_VIEW + " where `Patron_ID` = ?"; 
	
	String ACTIVE_TRANSACTIONS = "select * from " + Params.ACTIVE_TRANSACTION_VIEW;
	
}
