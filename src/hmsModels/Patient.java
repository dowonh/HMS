package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Patient implements Serializable {

	private int pid;
	private String name;
	private String gender;
	private String phone;
	private String birth;
	private String reservation_day;
	private String reservation_time;
	private String door;
	private String door_start_day;
	private String door_end_day;
	private int eid;
	private int rid;
	private Employee employee;
	private Category category;

	public Patient(){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getReservation_day() {
		return reservation_day;
	}

	public void setReservation_day(String reservation_day) {
		this.reservation_day = reservation_day;
	}

	public String getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(String reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getDoor() {
		return door;
	}

	public void setDoor(String door) {
		this.door = door;
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

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

}
