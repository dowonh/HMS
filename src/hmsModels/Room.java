package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Room implements Serializable {

	private int rid;
	private int roomnumber;
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

	public int getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
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
