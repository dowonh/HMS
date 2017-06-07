package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Prescription implements Serializable {
 
	private int prid;
	private String mname;
	private int how_long;
	private int day_dose;
	private int once_dose;
	private int doctornote_dnid;
	Patient patient;
	Indoor indoor;
	Doctornote doctornote;

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

	public int getHow_long() {
		return how_long;
	}

	public void setHow_long(int how_long) {
		this.how_long = how_long;
	}

	public int getDay_dose() {
		return day_dose;
	}

	public void setDay_dose(int day_dose) {
		this.day_dose = day_dose;
	}

	public int getOnce_dose() {
		return once_dose;
	}

	public void setOnce_dose(int once_dose) {
		this.once_dose = once_dose;
	}

	public int getDoctornote_dnid() {
		return doctornote_dnid;
	}

	public void setDoctornote_dnid(int doctornote_dnid) {
		this.doctornote_dnid = doctornote_dnid;
	}

	
	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	
	public Indoor getIndoor() {
		return indoor;
	}

	public void setIndoor(Indoor indoor) {
		this.indoor = indoor;
	}

	public Doctornote getDoctornote() {
		return doctornote;
	}

	public void setDoctornote(Doctornote doctornote) {
		this.doctornote = doctornote;
	}
 
}
