package hmsModels;

public class Indoor {
	int id;
	int room_number;
	String door_start_day;
	String door_end_day;
	int patient_pid;
	Patient patient;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRoom_number() {
		return room_number;
	}
	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}
	public String getDoor_start_day() {
		return door_start_day;
	}
	public void setDoor_start_day(String door_start_day) {
		this.door_start_day = door_start_day;
	}
	public String getDoor_end_day() {
		return door_end_day;
	}
	public void setDoor_end_day(String door_end_day) {
		this.door_end_day = door_end_day;
	}
	public int getPatient_pid() {
		return patient_pid;
	}
	public void setPatient_pid(int patient_pid) {
		this.patient_pid = patient_pid;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	
}
