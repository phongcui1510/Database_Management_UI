package phong.database.mgm.model;

import java.util.Date;

public class Service {

	private Integer service_id;
	private String estimate_time;
	private String estimate_price;
	private String problem_type;
	private Date completion_date;
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public String getEstimate_time() {
		return estimate_time;
	}
	public void setEstimate_time(String estimate_time) {
		this.estimate_time = estimate_time;
	}
	public String getEstimate_price() {
		return estimate_price;
	}
	public void setEstimate_price(String estimate_price) {
		this.estimate_price = estimate_price;
	}
	public String getProblem_type() {
		return problem_type;
	}
	public void setProblem_type(String problem_type) {
		this.problem_type = problem_type;
	}
	public Date getCompletion_date() {
		return completion_date;
	}
	public void setCompletion_date(Date completion_date) {
		this.completion_date = completion_date;
	}
	
}
