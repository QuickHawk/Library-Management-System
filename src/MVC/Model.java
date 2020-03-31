package MVC;

import DB.*;
import DB.Error;
import Beans.*;

import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;

import org.json.simple.*;
import org.json.simple.parser.*;

public class Model implements Operations{
	
	static Model model;
	private Connection conn;
	
	/* To import the JDBC Library into the Project */
	static {
		try {
			Class.forName(Params.DRIVER);
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	private Model()
	{
		
	}
	
	/* Singleton Class - No Extra Instances are needed for model*/
	public static Model getInstance()
	{
		if(model == null)
			model = new Model();
		
		return model;
	}
	
	/* Get Connection to the MySQL Database*/
	private Connection getConnection()
	{
		if(conn == null)
		{
			try {
				conn = DriverManager.getConnection(Params.URL, Params.USER, Params.PASS);
			}
			
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		
		return conn;
	}

	
	@Override
	public boolean changeLibrarian(String id, String name, String password) {
		// TODO :- Write the logic to change the librarian details
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.CHANGE_LIBRARIAN);
			
			stmt.setString(1, id);
			stmt.setString(2, name);
			stmt.setString(3, password);
			
			int t = stmt.executeUpdate();
			
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean login(String id, String password) {
		// TODO :- Check for authentication
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.LOGIN);
			
			stmt.setString(1, id);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				return rs.getBoolean(1);
			}
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean addPatron(Patron p) {
		// TODO :- Add Patron to database
		
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.ADD_PATRON);
			
			stmt.setString(1, p.getId());
			stmt.setString(2, p.getName());
			stmt.setString(3, p.getEmail());
			stmt.setString(4, p.getPhno());
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean modifyPatron(Patron newPatron) {
		// TODO :- Modify Patron in database
		
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.MODIFY_PATRON);
			
			stmt.setString(1, newPatron.getId());
			stmt.setString(2, newPatron.getName());
			stmt.setString(3, newPatron.getEmail());
			stmt.setString(4, newPatron.getPhno());
			stmt.setInt(5, newPatron.getDue_amount());
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean deletePatron(String id) {
		// TODO :- Delete Patron from database
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.DELETE_PATRON);			
			stmt.setString(1, id);
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean addBook(Book b) {
		// TODO :- Add Book to database
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.ADD_BOOK);
			
			stmt.setString(1, b.getTitle());
			stmt.setString(2, b.getAuthor());
			stmt.setString(3, b.getDescription());
			stmt.setInt(4, b.getCopies_available());
			stmt.setString(5, b.getPhoto_loc());
			
			stmt.setString(6, b.getSection());
			stmt.setInt(7, b.getShelf());
			
			stmt.setString(8, b.getTags());
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public boolean modifyBook(Book newBook) {
		// TODO :- Modify Book to database
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.MODIFY_BOOK);
			
			stmt.setString(1, newBook.getId());
			stmt.setString(2, newBook.getTitle());
			stmt.setString(3, newBook.getAuthor());
			stmt.setString(4, newBook.getDescription());
			stmt.setInt( 	5, newBook.getCopies_available());
			stmt.setString(6, newBook.getPhoto_loc());
			
			stmt.setString(7, newBook.getSection());
			stmt.setInt(8, newBook.getShelf());
			
			stmt.setString(9, newBook.getTags());
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
				
		return false;
	}

	@Override
	public boolean deleteBook(String id) {
		// TODO :- Delete Book from database
		
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.DELETE_BOOK);
			stmt.setString(1, id);
			
			int t = stmt.executeUpdate();
			if(t != 0)
				return true;
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}

	@Override
	public int issueBook(String book_id, String patron_id) {
		// TODO :- Issue a book and return the status
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.ISSUE_BOOK);

			stmt.setString(1, book_id);
			stmt.setString(2, patron_id);
		
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return Error.ISSUE_WRONG_PARAMETER;
	}

	@Override
	public int renewBook(String book_id, String patron_id) {
		// TODO :- Renew a book and return the status
		
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.RENEW_BOOK);

			stmt.setString(1, book_id);
			stmt.setString(2, patron_id);
		
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return Error.RENEW_WRONG_PARAMETER;
	}

	@Override
	public int returnBook(String book_id, String patron_id) {
		// TODO :- Return a book and return the status
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.RETURN_BOOK);

			stmt.setString(1, book_id);
			stmt.setString(2, patron_id);
		
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return Error.RETURN_WRONG_PARAMETER;

	}

	@Override
	public Book getBookDetails(String id) {
		// TODO :- Get a Book Detail
		
		Book b = new Book();
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.GET_BOOK_DETAILS);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				b.setId(rs.getString("ID"));
				b.setTitle(rs.getString("Title"));
				b.setAuthor(rs.getString("Author"));
				b.setDescription(rs.getString("Description"));
				b.setCopies_available(rs.getInt("Available"));
				b.setPhoto_loc(rs.getString("Photo Location"));
				
				b.setSection(rs.getString("Section"));
				b.setShelf(rs.getInt("Shelf"));
				
				b.setTags(rs.getString("Tags"));
				
				return b;
			}
			
			else
				return null;
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public Patron getPatronDetails(String id) {
		// TODO :- Get a Patron Detail
		
		Connection c = getConnection();
		Patron p = new Patron();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.GET_PATRON_DETAILS);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				p.setId(id);
				p.setName(rs.getString("Name"));
				p.setEmail(rs.getString("E-mail"));
				p.setPhno(rs.getString("Phone Number"));
				p.setDue_amount(rs.getInt("Amount Due"));
				
				return p;
			}
			
			else
				return null;
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public List<Book> searchBooks(String searchString) {
		// TODO :- Search for books which contain `searchString` in it and return List of Books
		
		ArrayList<Book> list = new ArrayList<Book>();
		Connection c = getConnection();
		
		try {
			PreparedStatement stmt = c.prepareStatement(Query.SEARCH_BOOKS);
			stmt.setString(1, searchString);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				Book b = getBookDetails(rs.getString("ID"));
				list.add(b);
			}
			
			return list;
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
		return null;
	}

	@Override
	public List<News> fetchTopNews() {
		// TODO :- Search for the Top News in Internet and return List of News Articles
		
		try{
			
		URL newsData = new URL("https://newsapi.org/v2/top-headlines?country=in");
		HttpURLConnection hru = (HttpURLConnection)newsData.openConnection();
		hru.setRequestMethod("GET");

		hru.setRequestProperty("X-Api-Key", "dbaa9c4a6e084ea383262200a45ece8e");
		
		hru.connect();
			
		BufferedReader in = new BufferedReader(new InputStreamReader(hru.getInputStream(), "UTF-8"));
		
		String inputLine = "";
		
		StringBuffer content = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
		    content.append(inputLine);
		}
		
		in.close();
		
		hru.disconnect();
		
		ArrayList<News> news = new ArrayList<News>();
		
			JSONParser parser = new JSONParser();
			JSONObject jsonData = (JSONObject)parser.parse(content.toString());
			JSONArray articles = (JSONArray)jsonData.get("articles");
			
			for(Object a : articles)
			{
				
				News n = new News();				
				JSONObject article = (JSONObject)a;
				
				Object title = article.get("title");
				Object desc = article.get("description");
				Object url = article.get("url");
				Object imageURL = article.get("urlToImage");
				
				n.setNewsTitle(title == null ? "" : title.toString());
				n.setNewsDescription(desc == null ? "" : desc.toString());
				n.setUrl(url == null ? "#" : url.toString());
				n.setUrlToImage(imageURL == null ? "" : imageURL.toString());				
							
				news.add(n);
			}
			
			return news;
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public List<Transaction> viewPatronTransactions(String id) {
		// TODO :- Search for a patron Transactions history and return list of all transaction
		ArrayList<Transaction> list = new ArrayList<Transaction>();
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.VIEW_PATRON_TRANSACTIONS);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				Transaction t = new Transaction();
				
				t.setBook_name(rs.getString("Book_Name"));
				t.setTransaction_type(rs.getString("Transaction_Type"));
				t.setPatron_name(id);
				t.setTime(rs.getTimestamp("Time"));
				
				list.add(t);
			}
			
			return list;
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}

	@Override
	public void changeAbout(String about, String fileLocation) {
		// TODO :- Change about in the Website
		
		try {
			
		FileWriter fout = new FileWriter(fileLocation);
		
		fout.write(about);
		fout.flush();
		
		fout.close();
		
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	

	@Override
	public void setLogo(String logo, String fileLocation) {
		// TODO :- Change Logo of the Website
		
		try {
			
			FileWriter fout = new FileWriter(new File(fileLocation));
			
			fout.write(logo);
			fout.flush();
			
			fout.close();
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
	
	@Override
	public String getLogo(String fileLocation)
	{
		try {
			
			Scanner s = new Scanner(new File(fileLocation));
			String logo = s.nextLine();
			s.close();
			
			return logo;		
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return "LMS";
	}

	@Override
	public String getAbout(String fileLocation) {
		// TODO :- Return The about stored in folder

		String about = "";
		
		try {
			
			Scanner r = new Scanner(new File(fileLocation));
			
			while(r.hasNextLine())
				about += r.nextLine();
			
			r.close();
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return about;
	}
	
	@Override
	public List<Transaction> viewActiveTransactions() {
		// TODO :- Get Active Transaction Data
		ArrayList<Transaction> list = new ArrayList<Transaction>();
		Connection c = getConnection();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.ACTIVE_TRANSACTIONS);
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next())
			{
				Transaction t = new Transaction();
				
				t.setBook_name(rs.getString("Book_Name"));
				t.setTransaction_type(rs.getString("Transaction_Type"));
				t.setPatron_name(rs.getString("Patron_Name"));
				t.setTime(rs.getTimestamp("Time"));
				
				list.add(t);
			}
			
			return list;
			
		}
		
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
		
	}

	@Override
	public Librarian getLibrarianDetails(String id) {
		// TODO :- Get the Librarian Details
		
		Connection c = getConnection();
		Librarian lib = new Librarian();
		
		try {
			
			PreparedStatement stmt = c.prepareStatement(Query.GET_LIBRARIAN_DETAILS);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next())
			{
				lib.setId(id);
				lib.setName(rs.getString("Name"));
				
				return lib;
			}
			
			else
				return null;
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	}
}
