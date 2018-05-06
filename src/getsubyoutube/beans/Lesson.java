package getsubyoutube.beans;

public class Lesson {
	private String idvideo;// name video
	private String linkimg;
	private String title;
	private String email;
	private String namesub;
	
	public Lesson(String idvideo, String linkimg, String title, String email, String namesub){
		this.idvideo = idvideo;
		this.linkimg  = linkimg;
		this.title = title;
		this.email = email;
		this.namesub = namesub;
	}
	
	public String getIdvideo() {
		return this.idvideo;
	}

	public void setIdvideo(String idvideo) {
		this.idvideo = idvideo;
	}
	
	public String getLinkimg() {
		return this.linkimg;
	}

	public void setLinkimg(String linkimg) {
		this.linkimg = linkimg;
	}
	
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public void setNameSub(String namesub) {
		this.namesub = namesub;
	}
	public String getNameSub() {
		return this.namesub;
	}
}
