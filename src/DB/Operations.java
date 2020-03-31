/*
 * Interface for Model Operations
 */
package DB;

import java.util.List;

import Beans.Book;
import Beans.Librarian;
import Beans.News;
import Beans.Patron;
import Beans.Transaction;

public interface Operations {

	/* Librarian Functions */
	boolean changeLibrarian(String id, String name, String password);
	boolean login(String id, String password);
	
	/* Patron Functions */
	boolean addPatron(Patron p);
	boolean modifyPatron(Patron newPatron);
	boolean deletePatron(String id);
	
	/* Book Functions */
	boolean addBook(Book b);
	boolean modifyBook(Book newBook);
	boolean deleteBook(String id);
	
	/* Library Activities */
	int issueBook(String book_id, String patron_id);
	int renewBook(String book_id, String patron_id);
	int returnBook(String book_id, String patron_id);
	
	/* Fetching Data */
	Book getBookDetails(String id);
	Patron getPatronDetails(String id);
	Librarian getLibrarianDetails(String id);
	
	List<Book> searchBooks(String searchString);
	List<News> fetchTopNews();
	
	List<Transaction> viewPatronTransactions(String id);
	List<Transaction> viewActiveTransactions();
	
	/* General Settings */
	void changeAbout(String about, String fileLocation);
	String getAbout(String fileLocation);
	
	void setLogo(String logo, String fileLocation);
	String getLogo(String fileLocation);
	
	
}
