package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Bill implements Serializable {

	int bid;
	int price;
	String date;
	int patient_pid;
	
	public Bill(){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getPatient_pid() {
		return patient_pid;
	}

	public void setPatient_pid(int patient_pid) {
		this.patient_pid = patient_pid;
	}
	
	

}
