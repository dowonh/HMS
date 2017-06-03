package hmsModels;

import hmsControllers.HmsFactory;

import java.io.Serializable;

public class Medicine implements Serializable {

	
	private int mid;
	private String name;
	private String type;
	
	public Medicine(){}
	
	public String toJson(){
		return HmsFactory.toJson(this);
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
 
}
