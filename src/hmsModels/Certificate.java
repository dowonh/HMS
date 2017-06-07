package hmsModels;
import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Certificate implements Serializable{
	
	Employee employee;
	Patient patient;
	Indoor indoor;
	Doctornote doctornote;
	Prescription prescription;
	Bill bill;
	
	public Certificate(){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
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

	public Prescription getPrescription() {
		return prescription;
	}

	public void setPrescription(Prescription prescription) {
		this.prescription = prescription;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}
	
}
