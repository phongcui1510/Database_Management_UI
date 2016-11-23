package phong.feedback.mgm.model;

import java.util.ArrayList;
import java.util.List;

public class CombineObject {

	private List<Vehicle> vehicle;
	private List<Billing> billing;
	private List<Customer> customer;
	private List<Service> service;
	private boolean selectQuery = true;
	private String errorMsg;
	private boolean showMsg;
	
	public boolean getShowMsg() {
		return showMsg;
	}
	public void setShowMsg(boolean showMsg) {
		this.showMsg = showMsg;
	}
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	public List<Vehicle> getVehicle() {
		if (this.vehicle == null) {
			this.vehicle = new ArrayList<Vehicle>();
		}
		return vehicle;
	}
	public void setVehicle(List<Vehicle> vehicle) {
		this.vehicle = vehicle;
	}
	public List<Billing> getBilling() {
		if (this.billing == null) {
			this.billing = new ArrayList<Billing>();
		}
		return billing;
	}
	public void setBilling(List<Billing> billing) {
		this.billing = billing;
	}
	public List<Customer> getCustomer() {
		if (this.customer == null) {
			this.customer = new ArrayList<Customer>();
		}
		return customer;
	}
	public void setCustomer(List<Customer> customer) {
		this.customer = customer;
	}
	public List<Service> getService() {
		if (this.service == null) {
			this.service = new ArrayList<Service>();
		}
		return service;
	}
	public void setService(List<Service> service) {
		this.service = service;
	}
	public boolean getSelectQuery() {
		return selectQuery;
	}
	public void setSelectQuery(boolean selectQuery) {
		this.selectQuery = selectQuery;
	}
	
}
