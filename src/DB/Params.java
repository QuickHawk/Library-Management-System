package DB;

public interface Params {
	
	/* JDBC Database Parameters */
	
	String DRIVER = "com.mysql.jdbc.Driver";
	
	String HOST = "localhost";
	String PORT = "3306";

	String USER = "root";
	String PASS = "aarya2013";
	
	String DATABASE = "Library";

	String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
	
	String BOOK_TABLE = "`Book`";
	String PATRON_TABLE = "`Patron`";
	String LIBRARIAN_TABLE = "`Librarian`";
	
	String PATRON_TRANSACTION_VIEW = "`PatronTransactions`";
	String ACTIVE_TRANSACTION_VIEW = "`ActiveTransactions`";
	
}
