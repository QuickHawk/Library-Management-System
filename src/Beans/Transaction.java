package Beans;

import java.sql.Timestamp;

public class Transaction {
	
	String book_name;
	String transaction_type;
	String patron_name;
	Timestamp time;
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	public String getPatron_name() {
		return patron_name;
	}
	public void setPatron_name(String patron_name) {
		this.patron_name = patron_name;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Transaction [book_name=" + book_name + ", transaction_type=" + transaction_type + ", patron_name="
				+ patron_name + ", time=" + time + "]";
	}
		
}
