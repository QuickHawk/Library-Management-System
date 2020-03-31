package Beans;

public class Patron {
	
	String id;
	String name;
	String email;
	String phno;
	int due_amount;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public int getDue_amount() {
		return due_amount;
	}
	public void setDue_amount(int due_amount) {
		this.due_amount = due_amount;
	}
	@Override
	public String toString() {
		return "Patron [id=" + id + ", name=" + name + ", email=" + email + ", phno=" + phno + ", due_amount="
				+ due_amount + "]";
	}	
	
}
