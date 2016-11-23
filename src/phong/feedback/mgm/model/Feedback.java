package phong.feedback.mgm.model;

public class Feedback {

	private Integer id;
	private String title;
	private String description;
	private String owner;
	private String date;
	public Feedback(){};
	public Feedback(String title, String description){
		this.title = title;
		this.description = description;
	};
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
