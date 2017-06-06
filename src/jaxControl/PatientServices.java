package jaxControl;

import hmsControllers.HmsFactory;
import hmsModels.Patient;

import java.sql.SQLException;

import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;


@Path("")
public class PatientServices {

	HmsFactory hms = new HmsFactory();

	
//	
//	@GET
//	@Path("patient/doctor/{uid}")
//	@Produces("application/json")
//	public String getDocPatientsJson(@PathParam("uid") int uid){
//		try {
//			return hms.getDocPatientsJson(uid);
//		} catch (SQLException e) {
//			Response.serverError();
//			return e.getMessage();
//		}
//	}
	
//	@GET
//	@Path("patient/all")
//	@Produces("application/json")
//	public String getPatientsJson(){
//		return hms.getPatientsJson();
//	}
//	
//	@GET
//	@Path("patient/{pid}")
//	@Produces("application/json")
//	public String getPatientJson(@PathParam("pid") int pid){
//		try {
//			return hms.getPatientJson(pid);
//		} catch (SQLException e) {
//			Response.serverError();
//			
//			return e.getMessage();
//		}
//	}
//	
//	@GET
//	@Path("patient/nurse/{uid}")
//	@Produces("application/json")
//	public String getNursePatientsJson(@PathParam("uid") int uid){
//		try {
//			return hms.getNursePatientsJson(uid);
//		} catch (SQLException e) {
//			Response.serverError();
//			return e.getMessage();
//		}
//	}
//	
	@POST
	@Path("patient")
	@Produces("application/json")
	public String addPatient(@FormParam("name") String name,
			@FormParam("gender") String gender,
			@FormParam("dob") String dob,
			@FormParam("phone") String phone,
			@FormParam("eid") int eid,
			@FormParam("reservation_date") String reservation_date,
			@FormParam("reservation_time") String reservation_time){
		
		Patient patient = new Patient();
		patient.setName(name);
		patient.setGender(gender);
		patient.setBirth(dob);
		patient.setPhone(phone);
		patient.setEid(eid);
		patient.setReservation_day(reservation_date);
		patient.setReservation_time(reservation_time);
		
		try {
			return hms.addPatient(patient);
		} catch (SQLException e) {
			Response.serverError();
			return e.getMessage();
		}
		
		
	}
}
