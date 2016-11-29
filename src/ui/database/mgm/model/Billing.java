package ui.database.mgm.model;

import java.util.Date;

public class Billing {

	private Integer id;
	private Date payment_date;
	private String payment_method;
	private Integer customer_id;
	private Integer service_id;
	private Integer sale_id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	public Integer getService_id() {
		return service_id;
	}
	public void setService_id(Integer service_id) {
		this.service_id = service_id;
	}
	public Integer getSale_id() {
		return sale_id;
	}
	public void setSale_id(Integer sale_id) {
		this.sale_id = sale_id;
	}
	
}
