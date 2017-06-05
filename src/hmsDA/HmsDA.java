package hmsDA;

import hmsModels.Category;
import hmsModels.doctornote;
import hmsModels.Employee;
import hmsModels.Medicine;
import hmsModels.MedicineGoods;
import hmsModels.Patient;
import hmsModels.Prescription;
import hmsModels.Room;

import java.sql.*;
import java.util.ArrayList;
import com.google.gson.JsonElement;


public class HmsDA {
	private static final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	private static final String JDBC_URL = "jdbc:mysql://loveljhs2.iptime.org:3306/hms?useUnicode=true&characterEncoding=UTF-8";
	private static final String USER = "root";
	private static final String PASSWD = "test";
	private Connection con = null;
	private Statement stmt = null;
	
	public HmsDA(){
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	 

//	public void connect() {
//		try {
//			//��񿬰�
//			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	public void disconnect() {
//		if(stmt != null) {
//			try {
//				stmt.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		} 
//		if(con != null) {
//			try {
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	// 간호사 페이지 부분 
	public ArrayList<Room> getRoomList(){
		//connect();
		ArrayList<Room> roomList = new ArrayList<Room>();

		try{
			Statement stmt = con.createStatement();
			
			ResultSet result = stmt.executeQuery("SELECT * FROM room");
 
			while(result.next()){
				
				Room room = new Room();
				room.setRid(result.getInt("rid"));
				room.setRoom_number(result.getInt("room_number"));
				room.setTotalbeds(result.getInt("totalbeds"));
				room.setAvailablebeds(result.getInt("availablebeds"));
				
				roomList.add(room);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		//	disconnect();
		}
		
		return roomList;
	}
	
	public ArrayList<MedicineGoods> getMedicineGoodsList() throws SQLException{
		ArrayList<MedicineGoods> medGoodList = new ArrayList<MedicineGoods>();
		try{
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM medicine_goods");
	 		ResultSet set = stmt.executeQuery();
			
			while(set.next()){
				MedicineGoods med = new MedicineGoods();
				med.setId(set.getInt("id"));
				med.setName(set.getString("name"));
				med.setPrice(set.getInt("price"));
				med.setCount(set.getInt("count"));
				medGoodList.add(med);
			}
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}

		return medGoodList;
	}
	
	public ArrayList<Patient> getIndoorList(int rid){
		ArrayList<Patient> indoorList = new ArrayList<Patient>();
		
		try{
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM patient where room_rid="+rid);
			while(set.next()){
				Patient pat = new Patient();
				
				pat.setName(set.getString("name"));
				pat.setGender(set.getString("gender"));
				pat.setPhone(set.getString("phone"));
				pat.setBirth(set.getString("birth"));
				pat.setDoor_start_day(set.getString("door_start_day"));
				pat.setRid(set.getInt("room_rid"));
				
				pat.setEmployee(getDoctor(set.getInt("employee_eid")));

				indoorList.add(pat);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return indoorList;
	}
	
	//관리자 페이지 부분 
	public ArrayList<Employee> getDoctorList(){
		
		ArrayList<Employee> docList = new ArrayList<Employee>();
		
		try{

			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee where type = 'doctor'");
 
			while(set.next()){
				Employee doc = new Employee();  
				doc.setEid(set.getInt("eid"));
				doc.setName(set.getString("name"));
				doc.setUsername(set.getString("username"));
				doc.setPasswd(set.getString("passwd"));
				doc.setGender(set.getString("gender"));
				if(set.getString("birth") == null ){
					 doc.setBirth("");
				}else{
					doc.setBirth(set.getString("birth"));
				}
				doc.setPhone(set.getString("phone"));
				doc.setSalary(set.getInt("salary"));
 
				doc.setCategory(getCategory(set.getInt("category_catid")));
				docList.add(doc);
			} 
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		}
		
		return docList;
	}
	
	public Category getCategory(int catid) throws SQLException{
		Category cat = new Category();
		try{
			Statement stmtCate = con.createStatement();
			ResultSet setCate = stmtCate.executeQuery("SELECT * FROM category WHERE catid="+catid);
			if(!setCate.next()) return null;
			
			cat.setCatid(catid);
			cat.setName(setCate.getString("name"));
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		}
		
		return cat;
	}
	
	public ArrayList<Category> getCategories() throws SQLException {
		//connect();
		ArrayList<Category> catList = new ArrayList<Category>();
		try{
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM category");
			ResultSet set = stmt.executeQuery();
			while(set.next()){
				Category cat = new Category();
				cat.setCatid(set.getInt("catid"));
				cat.setName(set.getString("name"));
				catList.add(cat);
			}
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		}
		return catList;
	}
 
	
	public int getCategoryID(String str) throws SQLException{
 		
		int ret = -1;
		try{ 
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM category WHERE name=?");
			stmt.setString(1, str);
			ResultSet set = stmt.executeQuery();
			if(!set.next()) return -1; 
			ret = set.getInt("catid");
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		}
		
		return ret;
	}
	//---------------------------
	// 어드민 의사부분
	//---------------------------
	public int addDoctor(Employee employee)throws SQLException{
		
		int did=0;
		//connect();
		try{
		PreparedStatement stmt = con.prepareStatement("INSERT INTO employee(name,username,passwd,gender,birth,phone,salary,type,category_catid) "
				+ "VALUES(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, employee.getName());
			stmt.setString(2, employee.getUsername());
			stmt.setString(3, employee.getPasswd());
			stmt.setString(4, employee.getGender());
			stmt.setString(5, employee.getBirth());
			stmt.setString(6, employee.getPhone());
			stmt.setInt(7, employee.getSalary());
			stmt.setString(8, employee.getType());
			stmt.setInt(9, employee.getCatid());
			
			stmt.executeUpdate();
			ResultSet keys = stmt.getGeneratedKeys();
			if(keys!=null && keys.next()) did=keys.getInt(1);

		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}
		return did;
	}
	public void updateDoctor(Employee employee) throws SQLException{
		//connect();
		try{
			PreparedStatement stmt = con.prepareStatement("UPDATE employee set name=?, passwd=?, "
					+ "gender=?, birth=?, phone=?, salary=?, category_catid=? WHERE eid=?");
			stmt.setString(1, employee.getName());
			stmt.setString(2, employee.getPasswd());
			
			stmt.setString(3, employee.getGender());
			stmt.setString(4, employee.getBirth());
			stmt.setString(5, employee.getPhone());
			stmt.setInt(6, employee.getSalary());
			stmt.setInt(7, employee.getCatid());
			stmt.setInt(8, employee.getEid());

			stmt.execute();
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}
	} 
	
	public Employee getDoctor(int eid) throws SQLException{
		Employee emp = new Employee();
		//connect();
		try{ 
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee WHERE eid="+eid);
			if(!set.next()) return null; 
			emp.setEid(set.getInt("eid"));
			emp.setName(set.getString("name"));
			emp.setUsername(set.getString("username"));
			emp.setPasswd(set.getString("passwd"));
			emp.setGender(set.getString("gender"));
			if(set.getString("birth") == null ){
				emp.setBirth("");
			}else{
				emp.setBirth(set.getString("birth"));
			}
			emp.setPhone(set.getString("phone"));
			emp.setSalary(set.getInt("salary"));
			emp.setCatid(set.getInt("category_catid"));
			emp.setCategory(getCategory(set.getInt("category_catid")));
 
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}
		return emp;
	}
	

	public void deleteEmployee(int eid) throws SQLException{
		
		try{ 
			PreparedStatement stmt = con.prepareStatement("DELETE FROM employee WHERE eid=?");
			stmt.setInt(1, eid);
			stmt.execute();
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}
		return;
	}
	//---------------------------
	// 어드민 간호사 부분
	//---------------------------
	public ArrayList<Employee> getNurseList(){
		ArrayList<Employee> NurseList = new ArrayList<Employee>();
		
		try{
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee where type = 'nurse'");
			while(set.next()){
				Employee emp = new Employee();
				
				emp.setEid(set.getInt("eid"));
				emp.setName(set.getString("name"));
				emp.setUsername(set.getString("username"));
				emp.setPasswd(set.getString("passwd"));
				emp.setGender(set.getString("gender"));
				if(set.getString("birth") == null ){
					emp.setBirth("");
				}else{
					emp.setBirth(set.getString("birth"));
				}
				emp.setPhone(set.getString("phone"));
				emp.setSalary(set.getInt("salary"));
				emp.setType(set.getString("type"));
				emp.setCatid(set.getInt("category_catid"));
				emp.setCategory(getCategory(set.getInt("category_catid")));
				NurseList.add(emp);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return NurseList;
	}
	
	public int addNurse(Employee nurse) throws SQLException{
		
		int nid=0;
		
		try{
			PreparedStatement stmt = con.prepareStatement("INSERT INTO employee(name,username,passwd,gender,birth,phone,salary,type,category_catid) "
					+ "VALUES(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
				stmt.setString(1, nurse.getName());
				stmt.setString(2, nurse.getUsername());
				stmt.setString(3, nurse.getPasswd());
				stmt.setString(4, nurse.getGender());
				stmt.setString(5, nurse.getBirth());
				stmt.setString(6, nurse.getPhone());
				stmt.setInt(7, nurse.getSalary());
				stmt.setString(8, nurse.getType());
				stmt.setInt(9, nurse.getCatid());
				
				stmt.executeUpdate();
				ResultSet keys = stmt.getGeneratedKeys();
				if(keys!=null && keys.next()) nid=keys.getInt(1);
		} catch(SQLException e){
			e.printStackTrace();
		}

		return nid;
	}
	public Employee getNurse(int nid) throws SQLException{
		Employee nurse = new Employee();
		
		try{
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee WHERE eid="+nid);
			if(!set.next()) return null;
			
			nurse.setEid(set.getInt("eid"));
			nurse.setName(set.getString("name"));
			nurse.setUsername(set.getString("username"));
			nurse.setPasswd(set.getString("passwd"));
			nurse.setGender(set.getString("gender"));
			if(set.getString("birth") == null ){
				nurse.setBirth("");
			}else{
				nurse.setBirth(set.getString("birth"));
			}
			nurse.setPhone(set.getString("phone"));
			nurse.setSalary(set.getInt("salary"));
			nurse.setCatid(set.getInt("category_catid"));
			nurse.setCategory(getCategory(set.getInt("category_catid")));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return nurse;
	}	
	public void updateNurse(Employee nurse) throws SQLException{
		
		try{
			PreparedStatement stmt = con.prepareStatement("UPDATE employee set name=?, passwd=?, "
					+ "gender=?, birth=?, phone=?, salary=?, category_catid=? WHERE eid=?");
			stmt.setString(1, nurse.getName());
			stmt.setString(2, nurse.getPasswd());
			
			stmt.setString(3, nurse.getGender());
			stmt.setString(4, nurse.getBirth());
			stmt.setString(5, nurse.getPhone());
			stmt.setInt(6, nurse.getSalary());
			stmt.setInt(7, nurse.getCatid());
			stmt.setInt(8, nurse.getEid());
			
			stmt.execute();	
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
	}
	
	//---------------------------
	// 어드민 방 정보 부분
	//---------------------------
	public int addRoom(Room room) throws SQLException{
		int rid=0;
		try{ 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO room(room_number,totalbeds,availablebeds) VALUES(?,?,?) ", Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, room.getRoom_number());
			stmt.setInt(2, room.getTotalbeds());
			stmt.setInt(3, room.getTotalbeds());
			stmt.executeUpdate();
			
			ResultSet keys = stmt.getGeneratedKeys();
			if(keys!=null && keys.next()) rid = keys.getInt(1);
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			//disconnect();
		}
		return rid;
	}
	//간호사 부분에서도 사용하고 어드민에서도 사용함
	public Room getRoom(int rid) throws SQLException{
		Room room = new Room();
		try{
			ResultSet set = con.createStatement().executeQuery("SELECT * FROM room WHERE rid="+rid);
			
			if(!set.next()) return null;
			room.setRid(set.getInt("rid"));
			room.setRoom_number(set.getInt("room_number"));
			room.setTotalbeds(set.getInt("totalbeds"));
			room.setAvailablebeds(set.getInt("availablebeds"));
		}catch(SQLException e){
			e.printStackTrace();
		} finally { 
		}

		return room;
	}
	
	public void updateRoom(Room room) throws SQLException{
		try{
			PreparedStatement stmt = con.prepareStatement("UPDATE room set totalbeds=? WHERE rid=?");
			stmt.setInt(1, room.getTotalbeds());
			stmt.setInt(2, room.getRid());
			
			stmt.execute();
		}catch(SQLException e){		
			e.printStackTrace();		
		} finally {
		}
	}
	
	public void deleteRoom(int rid) throws SQLException{
		try{
			PreparedStatement stmt = con.prepareStatement("DELETE FROM room WHERE rid=?");
			stmt.setInt(1, rid);
			stmt.execute();
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		}
	}
	//---------------------------
	// 어드민 환자관련
	//---------------------------
	public ArrayList<Patient> getPatientList(){
		
		ArrayList<Patient> patientList = new ArrayList<Patient>();
		
		try{
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM patient");
			
			while(set.next()){
				Patient patient = new Patient();
				patient.setPid(set.getInt("pid"));
				patient.setName(set.getString("name"));
				patient.setGender(set.getString("gender"));
				patient.setPhone(set.getString("phone"));
				patient.setBirth(set.getString("birth"));
				patient.setReservation_day(set.getString("reservation_day"));
				patient.setReservation_time(set.getString("reservation_time"));
				patient.setEid(set.getInt("employee_eid"));
				patient.setEmployee(getDoctor(set.getInt("employee_eid")));
				
			 	patientList.add(patient);
			}
		}
		catch(SQLException ex){
			ex.printStackTrace();
		}
		return patientList;
	}
 
	//---------------------------
	// 어드민 카테고리부분
	//---------------------------
	public Category addCategory(Category cat) throws SQLException {
		//connect();
		int catid=0;
		try{ 
			PreparedStatement stmt = con.prepareStatement("INSERT INTO category SET name=?",Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, cat.getName());
			
			stmt.executeUpdate();
			ResultSet keys = stmt.getGeneratedKeys();
			if(keys!=null && keys.next()) catid=keys.getInt(1);
			
			cat.setCatid(catid);
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		//	disconnect();
		}
		return cat;
	}

	public Category updateCategory(Category cat) throws SQLException {
		//connect();
		try{ 
			PreparedStatement stmt = con.prepareStatement("UPDATE category SET name=? WHERE catid=?");
			String name;
			if(cat.getName() == null) name = " ";
			else name = cat.getName();
			stmt.setString(1, name);
			stmt.setInt(2, cat.getCatid());
			stmt.execute();
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
		//	disconnect();
		}
		return cat;
	}

	public void deleteCategory(int catid) throws SQLException {
		try{
			PreparedStatement stmt = con.prepareStatement("DELETE FROM category WHERE catid=?");
			stmt.setInt(1, catid);
			stmt.execute();
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
		//	disconnect();
		}
		
	}
 
	// 나옹나옹
	public Patient addPatient(Patient p) throws SQLException{
		 
		try{
			PreparedStatement stmt = con.prepareStatement("INSERT INTO patient(name,gender,birth,phone,employee_eid,reservation_day,reservation_time) "
					+ "VALUES(?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1,p.getName());
			stmt.setString(2,p.getGender());
			stmt.setString(3,p.getBirth());
			stmt.setString(4,p.getPhone());
			stmt.setInt(5, p.getEid());
			stmt.setString(6, p.getReservation_day());
			stmt.setString(7, p.getReservation_time());
			stmt.executeUpdate();
			
			ResultSet keys = stmt.getGeneratedKeys();
			int pid = 0;
			if(keys!=null && keys.next()) pid = keys.getInt(1);
			p.setPid(pid);
			
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
		 
		}
		
		return p;
	}
	
	 
	/*
	public Employee getEmployee(int eid){
		Employee emp = new Employee();
		try{
			Statement stmt2 = con.createStatement();
			ResultSet set2 = stmt2.executeQuery("SELECT * FROM employee WHERE eid="+eid);
			if(!set2.next()) return null;
			
			emp.setFirstname(set2.getString("firstname"));
			emp.setLastname(set2.getString("lastname"));
			emp.setGender(set2.getString("gender"));
			emp.setDob(set2.getString("dob"));
			emp.setPhone(set2.getString("phone"));
			emp.setSalary(set2.getInt("salary"));
			emp.setUid(set2.getInt("uid"));
			emp.setEid(set2.getInt("eid"));
			emp.setUser(getUser(emp.getUid()));
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return emp;
	}
	

	
	public Category getCategory(String name){
		Category cat = new Category();
		try{
			Statement stmt4 = con.createStatement();
			ResultSet set4 = stmt4.executeQuery("SELECT * FROM category WHERE name='"+name+"'");
			if(!set4.next()) return null;
			
			cat.setCatid(set4.getInt("catid"));
			cat.setName(set4.getString("name"));
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return cat;
	}
	

	
	public Patient getPatient(int pid) throws SQLException{
		Patient patient = null;
		ResultSet set = con.createStatement().executeQuery("SELECT * FROM patient WHERE pid="+pid);
		while(set.next()){
			patient = new Patient();
			patient.setPid(set.getInt("pid"));
			patient.setName(set.getString("name"));
			patient.setGender(set.getString("gender"));
			patient.setDob(set.getString("dob"));
			patient.setType(set.getString("type"));
			patient.setCatid(set.getInt("catid"));
			patient.setDid(set.getInt("did"));
			
			patient.setCategory(getCategory(patient.getCatid()));
			
			if(patient.getDid()==0){
				patient.setDoctor(null);
			}
			else
			{
				patient.setDoctor(getDoctor(patient.getDid()));
			}
		}
		return patient;
	}

	

	
	
	

	

	
	
	

	
	public ArrayList<Prescription> getPrescriptionList() throws SQLException{
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM prescription");
		ResultSet set = stmt.executeQuery();
		
		
		return getPresListFromSet(set);
		
	}
	
	public Prescription getPrescription(int prid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM prescription WHERE prid=?");
		stmt.setInt(1, prid);
		ResultSet set = stmt.executeQuery();
		
		if(!set.next()) return null;
		
		Prescription pres = new Prescription();
		pres.setPrid(prid);
		pres.setDid(set.getInt("did"));
		pres.setMid(set.getInt("mid"));
		pres.setPid(set.getInt("pid"));
		pres.setDosage(set.getString("dosage"));
		
		pres.setDoctor(getDoctor(pres.getDid()));
		pres.setPatient(getPatient(pres.getPid()));
		pres.setMedicine(getMedicine(pres.getMid()));
		
		return pres;
		
		
	}
	
	public ArrayList<Prescription> getPresListFromSet(ResultSet set) throws SQLException{
		
		ArrayList<Prescription> presList = new ArrayList<Prescription>();
		
		while(set.next()){
			Prescription p = new Prescription();
			p.setPrid(set.getInt("prid"));
			p.setDid(set.getInt("did"));
			p.setDoctor(getDoctor(p.getDid()));
			p.setDosage(set.getString("dosage"));
			p.setMid(set.getInt("mid"));
			p.setMedicine(getMedicine(p.getMid()));
			p.setPid(set.getInt("pid"));
			p.setPatient(getPatient(p.getPid()));
			
			presList.add(p);
		}
		
		return presList;
		
	}
	
	public ArrayList<Patient> getDocPatientsList(int uid) throws SQLException{
		
		int eid = getEidByUid(uid);
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor WHERE eid=?");
		stmt.setInt(1, eid);
		ResultSet set = stmt.executeQuery();
		if(!set.next()) return null;
		
		int catid = set.getInt("catid");
		
		stmt = con.prepareStatement("SELECT * FROM patient WHERE catid=?");
		stmt.setInt(1, catid);
		set = stmt.executeQuery();
		
		return getPatientByCatid(catid);
		
	}
	
	public ArrayList<Prescription> getDocPresList(int uid) throws SQLException{
		
		int eid = getEidByUid(uid);
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor WHERE eid=?");
		stmt.setInt(1, eid);
		ResultSet set = stmt.executeQuery();
		if(!set.next()) return null;
		int did = set.getInt("did");
		
		stmt = con.prepareStatement("SELECT * FROM prescription WHERE did=?");
		stmt.setInt(1, did);
		set = stmt.executeQuery();
		
		return getPresListFromSet(set);
		
	}
	
	public ArrayList<Prescription> getPatientPres(int pid)throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM prescription WHERE pid=?");
		stmt.setInt(1, pid);
		ResultSet set = stmt.executeQuery();
		
		return getPresListFromSet(set);
	}
	
	public ArrayList<Patient> getPatientByCatid(int catid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM patient WHERE catid=?");
		stmt.setInt(1, catid);
		ResultSet set = stmt.executeQuery();
		ArrayList<Patient> patList= getPatientListFromSet(set);
		
		return patList;
	}
	
	public Medicine getMedicine(int mid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM medicine WHERE mid=?");
		stmt.setInt(1, mid);
		ResultSet set = stmt.executeQuery();
		
		Medicine med = new Medicine();
		if(!set.next()) return null;
		
		med.setMid(mid);
		med.setName(set.getString("name"));
		med.setPrice(set.getInt("price"));
		
		return med;
		
	}
	
	

	

	public int addEmployee(Employee employee) throws SQLException{
		
		employee.setUid(addUser(employee.getUser()));
		
		int eid=0;

		PreparedStatement stmt = con.prepareStatement("INSERT INTO employee(firstname,lastname,gender,dob,salary,phone,uid) VALUES(?,?,?,?,?,?,?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1,employee.getFirstname());
		stmt.setString(2,employee.getLastname());
		stmt.setString(3,employee.getGender());
		stmt.setString(4, employee.getDob());
		stmt.setInt(5,employee.getSalary());
		stmt.setString(6,employee.getPhone());
		stmt.setInt(7,employee.getUid());

		stmt.executeUpdate();
		ResultSet keys = stmt.getGeneratedKeys();
		if(keys!=null && keys.next()) eid=keys.getInt(1);
		employee.setEid(eid);
		return eid;
	}
	
	public int addUser(User user) throws SQLException{
		int uid=0;
		PreparedStatement stmt = con.prepareStatement("INSERT INTO users(username,password,type) VALUES(?,?,?) ", Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getType());
		
		stmt.executeUpdate();
		
		ResultSet keys = stmt.getGeneratedKeys();
		if(keys!=null && keys.next()) uid = keys.getInt(1);
		user.setUid(uid);
		return uid;
	}
	

	
	public void deletePatient(int pid) throws SQLException{
		
		PreparedStatement stmt = con.prepareStatement("DELETE FROM patient WHERE pid=?");
		stmt.setInt(1, pid);
		stmt.execute();
		
	}
	

	
	

	
	public Patient addPatient(Patient p) throws SQLException{
		
		PreparedStatement stmt = con.prepareStatement("INSERT INTO patient(name,gender,dob,catid) VALUES(?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1,p.getName());
		stmt.setString(2,p.getGender());
		stmt.setString(3,p.getDob());
		stmt.setInt(4, p.getCatid());
		stmt.executeUpdate();
		
		ResultSet keys = stmt.getGeneratedKeys();
		int pid = 0;
		if(keys!=null && keys.next()) pid = keys.getInt(1);
		
		p.setPid(pid);
		return p;
	}
	
	public void updateUser(User user) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("UPDATE users SET username=?, password=?, type=? WHERE uid=?");
		stmt.setString(1, user.getUsername());
		stmt.setString(2, user.getPassword());
		stmt.setString(3, user.getType());
		stmt.setInt(4, user.getUid());
		stmt.execute();
	}


	


	
	public ArrayList<Room> getNurseRooms(int nid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM room WHERE nid=?");
		stmt.setInt(1, nid);
		ResultSet set = stmt.executeQuery();
		
		ArrayList<Room> roomList = new ArrayList<Room>();
		
		while(set.next()){
			Room room = new Room();
			room.setRid(set.getInt("rid"));
			room.setAvailableBeds(set.getInt("availablebeds"));
			room.setNid(set.getInt("nid"));
			room.setNurse(getNurse(room.getNid()));
			room.setTotalBeds(set.getInt("totalbeds"));
			
			roomList.add(room);
		}
		
		return roomList;
	}
	
	public int getEidByUid(int uid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT eid FROM employee WHERE uid=?");
		stmt.setInt(1, uid);
		ResultSet set = stmt.executeQuery();
		if(!set.next()) return 0;
		
		int eid = set.getInt("eid");
		
		return eid;
	}
	
	public ArrayList<Room> getNurseRoomsByUid(int uid) throws SQLException{
		
		int eid = getEidByUid(uid);
		
		if(eid==0) return null;
		
		PreparedStatement stmt;
		stmt = con.prepareStatement("SELECT * FROM nurse WHERE eid=?");
		stmt.setInt(1, eid);
		ResultSet set = stmt.executeQuery();
		set.next();
		int nid = set.getInt("nid");
		return getNurseRooms(nid);
	}
	
	public int getDidByUid(int uid) throws SQLException{
		int eid = getEidByUid(uid);
		
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor WHERE eid=?");
		stmt.setInt(1, eid);
		ResultSet set = stmt.executeQuery();
		
		set.next();
		
		return set.getInt("did");
	}
	
	public void addIndoor(Indoor indo) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("INSERT INTO indoor SET disease=?,pid=?, status=?");
		stmt.setString(1, indo.getDisease());
		stmt.setInt(2, indo.getPid());
		stmt.setString(3,indo.getStatus());
		
		stmt.execute();
		
		stmt = con.prepareStatement("UPDATE patient SET type=? WHERE pid=?");
		stmt.setString(1, "indoor");
		stmt.setInt(2, indo.getPid());
		stmt.execute();
		
		
	}
	
	public void addPrescription(Prescription p) throws SQLException{
		
		PreparedStatement stmt = con.prepareStatement("INSERT INTO prescription SET dosage=?, pid=?, mid=?, did=?", Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, p.getDosage());
		stmt.setInt(2, p.getPid());
		stmt.setInt(3, p.getMid());
		stmt.setInt(4, p.getDid());
		
		stmt.executeUpdate();
		int prid=0;
		ResultSet keys = stmt.getGeneratedKeys();
		if(keys!=null && keys.next()) prid = keys.getInt(1);
		
		p.setDoctor(getDoctor(p.getDid()));
		p.setMedicine(getMedicine(p.getMid()));
		p.setPatient(getPatient(p.getPid()));
		p.setPrid(prid);
		
	}
	public Prescription updatePrescription(Prescription p)throws SQLException{
		PreparedStatement stmt = con.prepareStatement("UPDATE prescription SET dosage=?, mid=? WHERE prid=?");
		stmt.setString(1, p.getDosage());
		stmt.setInt(2, p.getMid());
		stmt.setInt(3, p.getPrid());
		
		stmt.execute();
		
		return getPrescription(p.getPrid());
	}
	
	public void removePres(int prid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("DELETE FROM prescription WHERE prid=?");
		stmt.setInt(1, prid);
		stmt.execute();
	}

	public void updateIndoorRid(int ipid, int rid) throws SQLException {
		
		PreparedStatement stmt = con.prepareStatement("UPDATE indoor SET rid=? WHERE ipid=?");
		stmt.setInt(1, rid);
		stmt.setInt(2, ipid);
		stmt.execute();
		
	}

	public void updatePatient(Patient p) throws SQLException {
		
		PreparedStatement stmt = con.prepareStatement("UPDATE patient SET name=?, gender=?, dob=?, type=?, catid=?, did=? WHERE pid=?");
		stmt.setString(1, p.getName());
		stmt.setString(2, p.getGender());
		stmt.setString(3, p.getDob());
		stmt.setString(4, p.getType());
		stmt.setInt(5, p.getCatid());
		stmt.setInt(6, p.getDid());
		stmt.setInt(7, p.getPid());
		stmt.execute();
		
	}

	public Medicine addMedicine(Medicine med) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("INSERT INTO medicine SET name=?, price=?", Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, med.getName());
		stmt.setInt(2, med.getPrice());
		
		stmt.executeUpdate();
		
		int mid=0;
		ResultSet keys = stmt.getGeneratedKeys();
		if(keys!=null && keys.next()) mid = keys.getInt(1);
		
		med.setMid(mid);
		
		return med;
		
		
	}

	public Medicine updateMedicine(Medicine med) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("UPDATE medicine SET name=?, price=? WHERE mid=?");
		stmt.setString(1, med.getName());
		stmt.setInt(2, med.getPrice());
		stmt.setInt(3,med.getMid());
		
		stmt.execute();
		return med;
	}

	public void removeMedicine(int mid) throws SQLException {
		
		PreparedStatement stmt = con.prepareStatement("DELETE FROM medicine WHERE mid=?");
		stmt.setInt(1, mid);
		stmt.execute();
		
	}


<<<<<<< HEAD
	public Category addCategory(Category cat) throws SQLException {
		
		PreparedStatement stmt = con.prepareStatement("INSERT INTO category SET name=?",Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, cat.getName());
		
		int catid=0;
		stmt.executeUpdate();
		ResultSet keys = stmt.getGeneratedKeys();
		if(keys!=null && keys.next()) catid=keys.getInt(1);
		
		cat.setCatid(catid);
		return cat;
	}
=======
	


>>>>>>> 54b6a58fcdd37003a7a8a7535ee2dbf4b9f0be1a



	public void decreaseBed(int rid) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM room WHERE rid=?");
		stmt.setInt(1, rid);
		ResultSet set = stmt.executeQuery();
		
		int availablebeds=0;
		
		if(set.next()) availablebeds = set.getInt("availablebeds");
		
		availablebeds--;
		
		stmt = con.prepareStatement("UPDATE room SET availablebeds=? WHERE rid=?");
		stmt.setInt(1, availablebeds);
		stmt.setInt(2, rid);
		stmt.execute();
		
	} */
}
