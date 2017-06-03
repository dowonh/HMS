package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class doctornote implements Serializable {

	
	private int dnid;
	private String symptom;
	private String note;
	private String day;
	
	public doctornote(){}

	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getDnid() {
		return dnid;
	}

	public void setDnid(int dnid) {
		this.dnid = dnid;
	}

	public String getSymptom() {
		return symptom;
	}

	public void setSymptom(String symptom) {
		this.symptom = symptom;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
}
