package hmsControllers;

import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;

import hmsDA.HmsDA;
import hmsModels.Category;
import hmsModels.doctornote;
import hmsModels.Employee;
import hmsModels.Medicine;
import hmsModels.MedicineGoods;
import hmsModels.Patient;
import hmsModels.Prescription;
import hmsModels.Room;
 

public class HmsFactory {
 
	HmsDA hms = new HmsDA();
	private static Gson g = new Gson();
	
	public static String toJson(Object obj){
		
		return g.toJson(obj);
	}
	
	//간호사가 사용
	public String getRoomsJson(){
		ArrayList<Room> roomList = hms.getRoomList();
		
		return g.toJson(roomList);
	}
	public String getRoomsRemainJson(){
		ArrayList<Room> roomList = hms.getRoomRemainList();
		
		return g.toJson(roomList);
	}
	public String getRoomJson(int rid) throws SQLException{
		
		Room room;
		room = hms.getRoom(rid); 
		
		return g.toJson(room);
	}
	
	public String getMedicinesGoodsJson() throws SQLException{
		ArrayList<MedicineGoods> medList = hms.getMedicineGoodsList();
		
		return g.toJson(medList);
	}
	//어드민페이지
	public String getDoctorsJson(){
		ArrayList<Employee> docList = hms.getDoctorList();
		return g.toJson(docList);
	}
	
	public String getCategoriesJson() throws SQLException {
		
		ArrayList<Category> catList = hms.getCategories();
		return g.toJson(catList);
		
		//return g.toJson(hms.getCategories());
	}
	//간호사 관련 가져오기
	public String getNursesJson(){
		ArrayList<Employee> nurseList = hms.getNurseList();
		
		return g.toJson(nurseList);
	}
	// 카테고리 관련부분
	public String addCategory(Category cat) throws SQLException {
		
		return hms.addCategory(cat).toJson();
	}
	public String updateCategory(Category cat) throws SQLException {
		return hms.updateCategory(cat).toJson();
	}	
//	public String getCategory(int catid) throws SQLException {
//		return hms.getCategory(catid).toJson();
//	}
	public void deleteCategory(int catid) throws SQLException {
		hms.deleteCategory(catid);
	}
 
	
	public String getDepartmentJson() throws SQLException {
		
		ArrayList<Category> catList = hms.getDepartment();
		return g.toJson(catList);
	}
	
	public String getDoctorJson(int did) throws SQLException{
		
		ArrayList<Employee> docList = hms.getSelectDoctor(did);
		return g.toJson(docList);
		
	}
 
	//환자 관련
	public String getPatientsJson(){
		ArrayList<Patient> patientList = hms.getPatientList();
		
		return g.toJson(patientList);
	}
	
	//입원 관련
	public String getIndoorsJson(int rid) throws SQLException{
		ArrayList<Patient> indoorList = hms.getIndoorList(rid);
		
		return g.toJson(indoorList);
	}
	
	public String updateIndoorRid(int pid, int rid) throws SQLException {
		
		Room room = hms.getRoom(rid);
		if(room.getAvailablebeds() > 0){
			
			hms.decreaseBed(rid);
 
			hms.updateIndoorPatient(pid, rid);
			
			return g.toJson(hms.getPatient(pid));
		}
		else
			return "Beds not available in the selected room.";
	}
//	public String getIndoorJson(int rid) throws SQLException{
//		
//		ArrayList<Patient> indoorPatientList = hms.getIndoor(rid);
//		
//		return g.toJson(indoorPatientList);
//	}
 

	  /*public ArrayList<Room> getRooms(){
		return hms.getRoomList();
	}
		/*
	public ArrayList<doctornote> getDoctors(){
		
		return hms.getDoctorList();
	}
	public ArrayList<Patient> getPatients(){
		return hms.getPatientList();
	}
	public ArrayList<Nurse> getNurses(){
		return hms.getNurseList();
	}

	public ArrayList<Indoor> getIndoors(){
		return hms.getIndoorList();
	}

	

	
	
	
	public String getNurseJson(int nid) throws SQLException{
		Nurse nurse;
		
		nurse = hms.getNurse(nid);
		
		return g.toJson(nurse);
			
	}
	

	
	public String getPatientJson(int pid) throws SQLException{
		
		Patient patient;

		patient = hms.getPatient(pid);
		
		return g.toJson(patient);
			
	}
	

	

	

	

	
	public String getNurseRoomsJson(int nid) throws SQLException{
		ArrayList<Room> roomList = hms.getNurseRooms(nid);
		
		return g.toJson(roomList);
	}
	
	public String getNurseRoomsJsonByUid(int uid) throws SQLException{
		ArrayList<Room> roomList = hms.getNurseRoomsByUid(uid);
		
		return g.toJson(roomList);
	}
	
	public String getNursePatientsJson(int uid) throws SQLException{
		ArrayList<Indoor> indoorList = hms.getNursePatients(uid);
		
		return g.toJson(indoorList);
	}
	

	
	public String getPrescriptionsJson() throws SQLException{
		ArrayList<Prescription> presList = hms.getPrescriptionList();
		
		return g.toJson(presList);
	}
	
	public String getPrescriptionsJson(int prid) throws SQLException{
		return hms.getPrescription(prid).toJson();
	}
	
	public String getDocPatientsJson(int uid) throws SQLException{
		ArrayList<Patient> patList = hms.getDocPatientsList(uid);
		
		return g.toJson(patList);
	}
	
	public String getDocPresJson(int uid) throws SQLException{
		ArrayList<Prescription> presList = hms.getDocPresList(uid);
		
		return g.toJson(presList);
	}
	
	public String getPatientPresJson(int pid) throws SQLException{
		ArrayList<Prescription> presList = hms.getPatientPres(pid);
		
		return g.toJson(presList);
	}
	
	public void addPres(Prescription p, int uid) throws SQLException{
		int did = hms.getDidByUid(uid);
		
		p.setDid(did);
		
		hms.addPrescription(p);
	}
	
	public String updatePres(Prescription pres, int uid) throws SQLException{
		int did = hms.getDidByUid(uid);
		
		pres.setDid(did);
		
		return hms.updatePrescription(pres).toJson();
	}
	
	public void removePres(int prid) throws SQLException{
		hms.removePres(prid);
	}
	
	public void addIndoor(Indoor indo) throws SQLException{
		
		hms.addIndoor(indo);
	}
	
	public void updatePatient(int pid, int uid, String type) throws SQLException{
		Patient p = hms.getPatient(pid);
		p.setDid(hms.getDidByUid(uid));
		p.setType(type);
		hms.updatePatient(p);
	}



	public String addMedicne(Medicine med) throws SQLException {
		
		return hms.addMedicine(med).toJson();
	}

	public String updateMedicine(Medicine med) throws SQLException {
		
		return hms.updateMedicine(med).toJson();
	}

	public String getMedicine(int mid) throws SQLException {
		
		return hms.getMedicine(mid).toJson();
		
	}

	public void removeMedicine(int mid) throws SQLException {
		
		hms.removeMedicine(mid);
	}
 
	public String addCategory(Category cat) throws SQLException {
		
		return hms.addCategory(cat).toJson();
	}
 





	public String addPatient(Patient patient) throws SQLException {
		return hms.addPatient(patient).toJson();
	}*/
}
