package Beans;

public class News {
	
	String newsTitle;
	String newsDescription;
	String url;
	String urlToImage;
	
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsDescription() {
		return newsDescription;
	}
	public void setNewsDescription(String newsDescription) {
		this.newsDescription = newsDescription;
	}
	public String getUrlToImage() {
		return urlToImage;
	}
	public void setUrlToImage(String urlToImage) {
		this.urlToImage = urlToImage;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "News [newsTitle=" + newsTitle + ", newsDescription=" + newsDescription + ", url=" + url
				+ ", urlToImage=" + urlToImage + "]";
	}
	
	
	
	
}
