package phong.database.mgm.model;

import java.util.Date;

public class Billing {

	private Integer billing_id;
	private Date payment_date;
	private String payment_method;
	public Integer getBilling_id() {
		return billing_id;
	}
	public void setBilling_id(Integer billing_id) {
		this.billing_id = billing_id;
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
}
