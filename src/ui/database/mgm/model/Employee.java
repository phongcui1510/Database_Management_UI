package ui.database.mgm.model;

public class Employee {

	private Integer id;
	private String name;
	private String address;
	private String email;
	private String phone;
	private Integer dealership;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getDealership() {
		return dealership;
	}
	public void setDealership(Integer dealership) {
		this.dealership = dealership;
	}
}
