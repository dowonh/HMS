package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Prescription implements Serializable {
	
	private int prid;
	private String mname;
	private int day;
	private int number;
	private int dnid;

	public Prescription(){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getPrid() {
		return prid;
	}

	public void setPrid(int prid) {
		this.prid = prid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getDnid() {
		return dnid;
	}

	public void setDnid(int dnid) {
		this.dnid = dnid;
	}
 
}
