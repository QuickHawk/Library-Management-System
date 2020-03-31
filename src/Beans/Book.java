package Beans;

public class Book {
	
	String id;
	String title;
	String author;
	String description;
	int copies_available;
	String photo_loc;	
	
	String section;
	int shelf;
	
	String tags;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCopies_available() {
		return copies_available;
	}

	public void setCopies_available(int copies_available) {
		this.copies_available = copies_available;
	}

	public String getPhoto_loc() {
		return photo_loc;
	}
	
	public void setPhoto_loc(String photo_loc) {
		this.photo_loc = photo_loc;
	}
	
	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public int getShelf() {
		return shelf;
	}

	public void setShelf(int shelf) {
		this.shelf = shelf;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	@Override
	public String toString() {
		return "{"
					+ "\"id\":\"" + id + "\","
					+ "\"title\":\"" + title + "\","
					+ "\"author\":\"" + author + "\","
					+ "\"description\":\"" + description + "\", "
					+ "\"copies_available\":\"" + copies_available + "\", "
					+ "\"photo_loc\":\"" + photo_loc + "\", "
					+ "\"section\":\"" + section + "\", "
					+ "\"shelf\":\"" + shelf + "\", "
					+ "\"tags\":\"" + tags + "\""
				+ "}";
	}

	
	
	
}
