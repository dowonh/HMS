package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Room implements Serializable {

	private int rid;
	private int room_number;
	private int totalbeds;
	private int availablebeds;
 
	public Room (){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getRoom_number() {
		return room_number;
	}

	public void setRoom_number(int room_number) {
		this.room_number = room_number;
	}

	public int getTotalbeds() {
		return totalbeds;
	}

	public void setTotalbeds(int totalbeds) {
		this.totalbeds = totalbeds;
	}

	public int getAvailablebeds() {
		return availablebeds;
	}

	public void setAvailablebeds(int availablebeds) {
		this.availablebeds = availablebeds;
	}
 
 
 
}
