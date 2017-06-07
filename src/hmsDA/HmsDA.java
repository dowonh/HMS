package hmsDA;

import hmsModels.Bill;
import hmsModels.Category;
import hmsModels.Certificate;
import hmsModels.Doctornote;
import hmsModels.Employee;
import hmsModels.Medicine;
import hmsModels.MedicineGoods;
import hmsModels.Patient;
import hmsModels.Prescription;
import hmsModels.Room;
import hmsModels.Indoor;

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

	public HmsDA() {
		try {
			Class.forName(JDBC_DRIVER);
			con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// public void connect() {
	// try {
	// //��񿬰�
	// con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }
	//
	// public void disconnect() {
	// if(stmt != null) {
	// try {
	// stmt.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// if(con != null) {
	// try {
	// con.close();
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// }
	// }

	// 간호사 페이지 부분
	public ArrayList<Room> getRoomList() {
		// connect();
		ArrayList<Room> roomList = new ArrayList<Room>();

		try {
			Statement stmt = con.createStatement();

			ResultSet result = stmt.executeQuery("SELECT * FROM room");

			while (result.next()) {

				Room room = new Room();
				room.setRid(result.getInt("rid"));
				room.setRoom_number(result.getInt("room_number"));
				room.setTotalbeds(result.getInt("totalbeds"));
				room.setAvailablebeds(result.getInt("availablebeds"));

				roomList.add(room);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

		return roomList;
	}

	public ArrayList<Room> getRoomRemainList() {
		// connect();
		ArrayList<Room> roomList = new ArrayList<Room>();

		try {
			Statement stmt = con.createStatement();

			ResultSet result = stmt.executeQuery("SELECT * FROM room where availablebeds != 0");

			while (result.next()) {

				Room room = new Room();
				room.setRid(result.getInt("rid"));
				room.setRoom_number(result.getInt("room_number"));
				room.setTotalbeds(result.getInt("totalbeds"));
				room.setAvailablebeds(result.getInt("availablebeds"));

				roomList.add(room);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

		return roomList;
	}

	public ArrayList<MedicineGoods> getMedicineGoodsList() throws SQLException {

		ArrayList<MedicineGoods> medGoodList = new ArrayList<MedicineGoods>();
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM medicine_goods");
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
				MedicineGoods med = new MedicineGoods();
				med.setId(set.getInt("id"));
				med.setName(set.getString("name"));
				med.setPrice(set.getInt("price"));
				med.setCount(set.getInt("count"));
				medGoodList.add(med);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

		return medGoodList;
	}

	public ArrayList<Medicine> getMedicineList() throws SQLException {

		ArrayList<Medicine> medList = new ArrayList<Medicine>();
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT DISTINCT type FROM medicine");
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
				Medicine medi = new Medicine();
				medi.setType(set.getString("type"));
				medList.add(medi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

		return medList;
	}

	public ArrayList<Medicine> getMedicinetypeList(String mtype) throws SQLException {

		ArrayList<Medicine> medList = new ArrayList<Medicine>();
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM medicine WHERE type= '" + mtype + "'");
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
				Medicine medi = new Medicine();
				medi.setMid(set.getInt("mid"));
				medi.setName(set.getString("name"));
				medi.setType(set.getString("type"));
				medList.add(medi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

		return medList;
	}

	public ArrayList<Patient> getIndoorList(int rid) {
		ArrayList<Patient> indoorList = new ArrayList<Patient>();

		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM patient where room_rid=" + rid);
			while (set.next()) {
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
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return indoorList;
	}

	// 관리자 페이지 부분
	public ArrayList<Employee> getDoctorList() {

		ArrayList<Employee> docList = new ArrayList<Employee>();

		try {

			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee where type = 'doctor'");

			while (set.next()) {
				Employee doc = new Employee();
				doc.setEid(set.getInt("eid"));
				doc.setName(set.getString("name"));
				doc.setUsername(set.getString("username"));
				doc.setPasswd(set.getString("passwd"));
				doc.setGender(set.getString("gender"));
				if (set.getString("birth") == null) {
					doc.setBirth("");
				} else {
					doc.setBirth(set.getString("birth"));
				}
				doc.setPhone(set.getString("phone"));
				doc.setSalary(set.getInt("salary"));

				doc.setCategory(getCategory(set.getInt("category_catid")));
				docList.add(doc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}

		return docList;
	}

	public Category getCategory(int catid) throws SQLException {
		Category cat = new Category();
		try {
			Statement stmtCate = con.createStatement();
			ResultSet setCate = stmtCate.executeQuery("SELECT * FROM category WHERE catid=" + catid);
			if (!setCate.next())
				return null;

			cat.setCatid(catid);
			cat.setName(setCate.getString("name"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}

		return cat;
	}

	public ArrayList<Category> getCategories() throws SQLException {
		// connect();
		ArrayList<Category> catList = new ArrayList<Category>();
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM category");
			ResultSet set = stmt.executeQuery();
			while (set.next()) {
				Category cat = new Category();
				cat.setCatid(set.getInt("catid"));
				cat.setName(set.getString("name"));
				catList.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return catList;
	}

	public int getCategoryID(String str) throws SQLException {

		int ret = -1;
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM category WHERE name=?");
			stmt.setString(1, str);
			ResultSet set = stmt.executeQuery();
			if (!set.next())
				return -1;
			ret = set.getInt("catid");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}

		return ret;
	}

	// ---------------------------
	// 어드민 의사부분
	// ---------------------------
	public int addDoctor(Employee employee) throws SQLException {

		int did = 0;
		// connect();
		try {
			PreparedStatement stmt = con.prepareStatement(
					"INSERT INTO employee(name,username,passwd,gender,birth,phone,salary,type,category_catid) "
							+ "VALUES(?,?,?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
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
			if (keys != null && keys.next())
				did = keys.getInt(1);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return did;
	}

	public void updateDoctor(Employee employee) throws SQLException {
		// connect();
		try {
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
	}

	public Employee getDoctor(int eid) throws SQLException {
		Employee emp = new Employee();
		// connect();
		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee WHERE eid=" + eid);
			if (!set.next())
				return null;
			emp.setEid(set.getInt("eid"));
			emp.setName(set.getString("name"));
			emp.setUsername(set.getString("username"));
			emp.setPasswd(set.getString("passwd"));
			emp.setGender(set.getString("gender"));
			if (set.getString("birth") == null) {
				emp.setBirth("");
			} else {
				emp.setBirth(set.getString("birth"));
			}
			emp.setPhone(set.getString("phone"));
			emp.setSalary(set.getInt("salary"));
			emp.setCatid(set.getInt("category_catid"));
			emp.setCategory(getCategory(set.getInt("category_catid")));

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return emp;
	}

	public void deleteEmployee(int eid) throws SQLException {

		try {
			PreparedStatement stmt = con.prepareStatement("DELETE FROM employee WHERE eid=?");
			stmt.setInt(1, eid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return;
	}

	// ---------------------------
	// 어드민 간호사 부분
	// ---------------------------
	public ArrayList<Employee> getNurseList() {
		ArrayList<Employee> NurseList = new ArrayList<Employee>();

		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee where type = 'nurse'");
			while (set.next()) {
				Employee emp = new Employee();

				emp.setEid(set.getInt("eid"));
				emp.setName(set.getString("name"));
				emp.setUsername(set.getString("username"));
				emp.setPasswd(set.getString("passwd"));
				emp.setGender(set.getString("gender"));
				if (set.getString("birth") == null) {
					emp.setBirth("");
				} else {
					emp.setBirth(set.getString("birth"));
				}
				emp.setPhone(set.getString("phone"));
				emp.setSalary(set.getInt("salary"));
				emp.setType(set.getString("type"));
				emp.setCatid(set.getInt("category_catid"));
				emp.setCategory(getCategory(set.getInt("category_catid")));
				NurseList.add(emp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return NurseList;
	}

	public int addNurse(Employee nurse) throws SQLException {

		int nid = 0;

		try {
			PreparedStatement stmt = con.prepareStatement(
					"INSERT INTO employee(name,username,passwd,gender,birth,phone,salary,type,category_catid) "
							+ "VALUES(?,?,?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
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
			if (keys != null && keys.next())
				nid = keys.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return nid;
	}

	public Employee getNurse(int nid) throws SQLException {
		Employee nurse = new Employee();

		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee WHERE eid=" + nid);
			if (!set.next())
				return null;

			nurse.setEid(set.getInt("eid"));
			nurse.setName(set.getString("name"));
			nurse.setUsername(set.getString("username"));
			nurse.setPasswd(set.getString("passwd"));
			nurse.setGender(set.getString("gender"));
			if (set.getString("birth") == null) {
				nurse.setBirth("");
			} else {
				nurse.setBirth(set.getString("birth"));
			}
			nurse.setPhone(set.getString("phone"));
			nurse.setSalary(set.getInt("salary"));
			nurse.setCatid(set.getInt("category_catid"));
			nurse.setCategory(getCategory(set.getInt("category_catid")));
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return nurse;
	}

	public void updateNurse(Employee nurse) throws SQLException {

		try {
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
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ---------------------------
	// 어드민 방 정보 부분
	// ---------------------------
	public int addRoom(Room room) throws SQLException {
		int rid = 0;
		try {
			PreparedStatement stmt = con.prepareStatement(
					"INSERT INTO room(room_number,totalbeds,availablebeds) VALUES(?,?,?) ",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setInt(1, room.getRoom_number());
			stmt.setInt(2, room.getTotalbeds());
			stmt.setInt(3, room.getTotalbeds());
			stmt.executeUpdate();

			ResultSet keys = stmt.getGeneratedKeys();
			if (keys != null && keys.next())
				rid = keys.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return rid;
	}

	// 간호사 부분에서도 사용하고 어드민에서도 사용함
	public Room getRoom(int rid) throws SQLException {
		Room room = new Room();
		try {
			ResultSet set = con.createStatement().executeQuery("SELECT * FROM room WHERE rid=" + rid);

			if (!set.next())
				return null;
			room.setRid(set.getInt("rid"));
			room.setRoom_number(set.getInt("room_number"));
			room.setTotalbeds(set.getInt("totalbeds"));
			room.setAvailablebeds(set.getInt("availablebeds"));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}

		return room;
	}

	public void updateRoom(Room room) throws SQLException {
		try {
			PreparedStatement stmt = con.prepareStatement("UPDATE room set totalbeds=? WHERE rid=?");
			stmt.setInt(1, room.getTotalbeds());
			stmt.setInt(2, room.getRid());

			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
	}

	public void deleteRoom(int rid) throws SQLException {
		try {
			PreparedStatement stmt = con.prepareStatement("DELETE FROM room WHERE rid=?");
			stmt.setInt(1, rid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
	}

	// ---------------------------
	// 어드민 환자관련
	// ---------------------------
	public ArrayList<Patient> getPatientList() {

		ArrayList<Patient> patientList = new ArrayList<Patient>();

		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM patient");

			while (set.next()) {

				String string_reservation_day = " ";
				String string_door_start_day = " ";
				String string_door_end_day = " ";
				if (set.getString("reservation_day") != null)
					string_reservation_day = set.getString("reservation_day");
				if (set.getString("door_start_day") != null)
					string_door_start_day = set.getString("door_start_day");
				if (set.getString("door_end_day") != null)
					string_door_end_day = set.getString("door_end_day");

				Patient patient = new Patient();
				patient.setPid(set.getInt("pid"));
				patient.setName(set.getString("name"));
				patient.setGender(set.getString("gender"));
				patient.setPhone(set.getString("phone"));
				patient.setBirth(set.getString("birth"));
				patient.setReservation_day(string_reservation_day);
				patient.setReservation_time(set.getString("reservation_time"));
				patient.setDoor(set.getString("door"));
				patient.setDoor_start_day(string_door_start_day);
				patient.setDoor_end_day(string_door_end_day);
				patient.setEid(set.getInt("employee_eid"));
				patient.setRid(set.getInt("room_rid"));
				patient.setEmployee(getDoctor(set.getInt("employee_eid")));

				patientList.add(patient);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return patientList;
	}

	// ---------------------------
	// 어드민 카테고리부분
	// ---------------------------
	public Category addCategory(Category cat) throws SQLException {
		// connect();
		int catid = 0;
		try {
			PreparedStatement stmt = con.prepareStatement("INSERT INTO category SET name=?",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, cat.getName());

			stmt.executeUpdate();
			ResultSet keys = stmt.getGeneratedKeys();
			if (keys != null && keys.next())
				catid = keys.getInt(1);

			cat.setCatid(catid);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return cat;
	}

	public Category updateCategory(Category cat) throws SQLException {
		// connect();
		try {
			PreparedStatement stmt = con.prepareStatement("UPDATE category SET name=? WHERE catid=?");
			String name;
			if (cat.getName() == null)
				name = " ";
			else
				name = cat.getName();
			stmt.setString(1, name);
			stmt.setInt(2, cat.getCatid());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}
		return cat;
	}

	public void deleteCategory(int catid) throws SQLException {
		try {
			PreparedStatement stmt = con.prepareStatement("DELETE FROM category WHERE catid=?");
			stmt.setInt(1, catid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// disconnect();
		}

	}

	// 나옹나옹
	public Patient addPatient(Patient p) throws SQLException {

		try {
			PreparedStatement stmt = con.prepareStatement(
					"INSERT INTO patient(name,gender,birth,phone,employee_eid,reservation_day,reservation_time)"
							+ "VALUES(?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, p.getName());
			stmt.setString(2, p.getGender());
			stmt.setString(3, p.getBirth());
			stmt.setString(4, p.getPhone());
			stmt.setInt(5, p.getEid());
			stmt.setString(6, p.getReservation_day());
			stmt.setString(7, p.getReservation_time());
			stmt.executeUpdate();

			ResultSet keys = stmt.getGeneratedKeys();
			int pid = 0;
			if (keys != null && keys.next())
				pid = keys.getInt(1);
			p.setPid(pid);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}

		return p;
	}

	// 의사 - 환자보기 도원
	public ArrayList<Patient> getDocPatientsList() throws SQLException {
		ArrayList<Patient> patientList = new ArrayList<Patient>();

		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("select * from patient where reservation_day = curdate()");

			while (set.next()) {
				Patient patient = new Patient();

				patient.setPid(set.getInt("pid"));
				patient.setName(set.getString("name"));
				patient.setGender(set.getString("gender"));
				patient.setPhone(set.getString("phone"));
				patient.setBirth(set.getString("birth"));
				patient.setReservation_day(set.getString("reservation_day"));
				patient.setReservation_time(set.getString("reservation_time"));
				patient.setDoor_start_day(set.getString("door_start_day"));
				patient.setDoor_end_day(set.getString("door_end_day"));
				patient.setDoor(set.getString("door"));
				patient.setEid(set.getInt("employee_eid"));
				patient.setRid(set.getInt("room_rid"));
				patient.setEmployee(getDoctor(set.getInt("employee_eid")));

				patientList.add(patient);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return patientList;
	}

	// //의사 - 환자 개인보기 도원
	// public ArrayList<Patient> getDocPatientsList(int pid) throws
	// SQLException{
	// ArrayList<Patient> patientList = new ArrayList<Patient>();
	//
	// try{
	// Statement stmt = con.createStatement();
	// ResultSet set = stmt.executeQuery("select * from patient where
	// reservation_day = curdate()");
	//
	// while(set.next()){
	// Patient patient = new Patient();
	//
	// patient.setPid(set.getInt("pid"));
	// patient.setName(set.getString("name"));
	// patient.setGender(set.getString("gender"));
	// patient.setPhone(set.getString("phone"));
	// patient.setBirth(set.getString("birth"));
	// patient.setReservation_day(set.getString("reservation_day"));
	// patient.setReservation_time(set.getString("reservation_time"));
	// patient.setEid(set.getInt("employee_eid"));
	// patient.setEmployee(getDoctor(set.getInt("employee_eid")));
	//
	// patientList.add(patient);
	// }
	// }
	// catch(SQLException ex){
	// ex.printStackTrace();
	// }
	//
	// return patientList;
	//
	// }
	// 나옹나옹
	public ArrayList<Category> getDepartment() throws SQLException {
		// connect();
		ArrayList<Category> catList = new ArrayList<Category>();
		try {
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM category WHERE NOT name='관리자' AND NOT name='간호사'");
			ResultSet set = stmt.executeQuery();
			while (set.next()) {
				Category cat = new Category();
				cat.setCatid(set.getInt("catid"));
				cat.setName(set.getString("name"));
				catList.add(cat);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return catList;
	}

	public ArrayList<Employee> getSelectDoctor(int did) throws SQLException {

		ArrayList<Employee> docList = new ArrayList<Employee>();

		try {

			stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM employee WHERE category_catid =" + did);

			while (set.next()) {
				Employee doc = new Employee();
				doc.setEid(set.getInt("eid"));
				doc.setName(set.getString("name"));
				doc.setUsername(set.getString("username"));
				doc.setPasswd(set.getString("passwd"));
				doc.setGender(set.getString("gender"));
				if (set.getString("birth") == null) {
					doc.setBirth("");
				} else {
					doc.setBirth(set.getString("birth"));
				}
				doc.setPhone(set.getString("phone"));
				doc.setSalary(set.getInt("salary"));
				doc.setCatid(set.getInt("category_catid"));
				docList.add(doc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
		return docList;
	}

	// 나옹나옹
	public ArrayList<Patient> reservationCheck(Patient p) throws SQLException {
		ArrayList<Patient> patientList = new ArrayList<Patient>();

		try {

			PreparedStatement stmt = con.prepareStatement("select * from patient where name=? and phone=?");

			stmt.setString(1, p.getName());
			stmt.setString(2, p.getPhone());
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
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
				patient.setCategory(getCategory(getDoctor(set.getInt("employee_eid")).getCatid()));
				patientList.add(patient);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return patientList;
	}

	// 나옹나옹
	public Indoor indoorCheck(Patient p) throws SQLException {
		Patient patient = new Patient();

		try {

			PreparedStatement stmt = con
					.prepareStatement("select * from patient where name=? and phone=? and door = 'YES'");

			stmt.setString(1, p.getName());
			stmt.setString(2, p.getPhone());
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
				patient.setPid(set.getInt("pid"));
				patient.setName(set.getString("name"));
				patient.setGender(set.getString("gender"));
				patient.setPhone(set.getString("phone"));
				patient.setBirth(set.getString("birth"));
				patient.setReservation_day(set.getString("reservation_day"));
				patient.setReservation_time(set.getString("reservation_time"));
				patient.setEid(set.getInt("employee_eid"));
				patient.setEmployee(getDoctor(set.getInt("employee_eid")));
				patient.setCategory(getCategory(getDoctor(set.getInt("employee_eid")).getCatid()));
				// patientList.add(patient);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		System.out.println(patient);
		return getIndoor(patient);
	}

	public void decreaseBed(int rid) throws SQLException {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM room WHERE rid=?");
			stmt.setInt(1, rid);
			ResultSet set = stmt.executeQuery();

			int availablebeds = 0;

			if (set.next())
				availablebeds = set.getInt("availablebeds");

			availablebeds--;

			stmt = con.prepareStatement("UPDATE room SET availablebeds=? WHERE rid=?");
			stmt.setInt(1, availablebeds);
			stmt.setInt(2, rid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

	}

	public void updateIndoorPatient(int pid, int rid) throws SQLException {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"UPDATE patient SET door = 'YES', door_start_day= curdate(), room_rid=? WHERE pid=?");

			stmt.setInt(1, rid);
			stmt.setInt(2, pid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

	}

	public void outRoom(int pid, int rid) throws SQLException {

		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM room WHERE rid=?");
			stmt.setInt(1, rid);
			ResultSet set = stmt.executeQuery();

			int availablebeds = 0;
			String room_number = null;
			Patient p = getPatient(pid);

			if (set.next()) {
				availablebeds = set.getInt("availablebeds");
				room_number = set.getString("room_number");
			}

			availablebeds++;
			stmt = con.prepareStatement("UPDATE room SET availablebeds=? WHERE rid=?");
			stmt.setInt(1, availablebeds);
			stmt.setInt(2, rid);
			stmt.execute();

			stmt = con.prepareStatement(
					"UPDATE patient SET door = 'NO', door_start_day= null, room_rid= null WHERE pid=?");
			stmt.setInt(1, pid);
			stmt.execute();

			stmt = con.prepareStatement("INSERT INTO indoors(room_number, door_start_day, door_end_day, patient_pid) "
					+ "VALUES(?, ?, curdate(), ?)", Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, room_number);
			stmt.setString(2, p.getDoor_start_day());
			stmt.setInt(3, pid);

			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		}
	}

	// 나옹나옹 - 내원일자 조회
	public Indoor getIndoor(Patient p) {
		Indoor indoor = new Indoor();
		System.out.println(p.getPid());
		try {
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery("SELECT * FROM indoors where patient_pid=" + p.getPid());
			while (set.next()) {

				indoor.setPatient(getPatient(set.getInt("patient_pid")));
				indoor.setDoor_start_day(set.getString("door_start_day"));

				indoor.setDoor_end_day(set.getString("door_end_day"));

				indoor.setRoom_number(set.getInt("room_number"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(indoor.getPatient().getName());
		System.out.println(indoor.getDoor_start_day());
		System.out.println(indoor.getDoor_end_day());
		System.out.println(indoor.getRoom_number());

		return indoor;
	}

	public Patient getPatient(int pid) throws SQLException {

		ResultSet set = con.createStatement().executeQuery("SELECT * FROM patient WHERE pid=" + pid);

		if (!set.next())
			return null;
		String string_reservation_day = " ";
		String string_door_start_day = " ";
		String string_door_end_day = " ";
		if (set.getString("reservation_day") != null)
			string_reservation_day = set.getString("reservation_day");
		if (set.getString("door_start_day") != null)
			string_door_start_day = set.getString("door_start_day");
		if (set.getString("door_end_day") != null)
			string_door_end_day = set.getString("door_end_day");

		Patient patient = new Patient();
		patient.setPid(set.getInt("pid"));
		patient.setName(set.getString("name"));
		patient.setGender(set.getString("gender"));
		patient.setPhone(set.getString("phone"));
		patient.setBirth(set.getString("birth"));
		patient.setReservation_day(string_reservation_day);
		patient.setReservation_time(set.getString("reservation_time"));
		patient.setDoor(set.getString("door"));
		patient.setDoor_start_day(string_door_start_day);
		patient.setDoor_end_day(string_door_end_day);
		patient.setEid(set.getInt("employee_eid"));
		patient.setRid(set.getInt("room_rid"));
		patient.setEmployee(getDoctor(set.getInt("employee_eid")));

		return patient;
	}

	// 나옹나옹 - 약처방 조회
	public ArrayList<Prescription> medicineCheck(Patient p) throws SQLException {
		Patient patient = new Patient();
		Doctornote doctornote = new Doctornote();
		ArrayList<Prescription> prescriptionList = new ArrayList<Prescription>();

		try {
			int pid = 0;
			int dnid = 0;

			PreparedStatement stmt = con.prepareStatement("select * from patient where name=? and phone=?");

			stmt.setString(1, p.getName());
			stmt.setString(2, p.getPhone());
			ResultSet set = stmt.executeQuery();

			while (set.next()) {

				patient.setName(set.getString("name"));
				patient.setEmployee(getDoctor(set.getInt("employee_eid")));
				patient.setCategory(getCategory(getDoctor(set.getInt("employee_eid")).getCatid()));
				pid = set.getInt("pid");
			}

			stmt = con.prepareStatement(
					"select * from doctornote where patient_pid=" + pid + " order by day desc limit 1");
			set = stmt.executeQuery();

			while (set.next()) {
				System.out.println(set.getInt("dnid"));
				dnid = set.getInt("dnid");
				doctornote.setDnid(set.getInt("dnid"));
				doctornote.setSymptom(set.getString("symptom"));
				doctornote.setDiease(set.getString("disease"));
				doctornote.setNote(set.getString("note"));
				doctornote.setDay(set.getString("day"));
			}

			stmt = con.prepareStatement("select * from prescription where doctornote_dnid=" + dnid);
			set = stmt.executeQuery();

			while (set.next()) {

				Prescription prescription = new Prescription();
				prescription.setPatient(patient);
				prescription.setDoctornote(doctornote);
				prescription.setPrid(set.getInt("prid"));
				prescription.setMname(set.getString("mname"));
				prescription.setHow_long(set.getInt("how_long"));
				prescription.setDay_dose(set.getInt("day_dose"));
				prescription.setOnce_dose(set.getInt("once_dose"));

				prescriptionList.add(prescription);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}

		return prescriptionList;
	}

	public void removeMedicine(int mid) throws SQLException {

		PreparedStatement stmt = con.prepareStatement("DELETE FROM medicine WHERE mid=?");
		stmt.setInt(1, mid);
		stmt.execute();
	}

	// 나옹나옹 - 입퇴원 증명서
	public Certificate Certificate(Patient p) throws SQLException {

		Patient patient = new Patient();
		Indoor indoor = new Indoor();
		Doctornote doctornote = new Doctornote();
		Prescription prescription = new Prescription();
		Bill bill = new Bill();
		Certificate certificate = new Certificate();

		try {
			int pid = 0;
			int dnid = 0;

			PreparedStatement stmt = con.prepareStatement("select * from patient where name=? and phone=?");

			stmt.setString(1, p.getName());
			stmt.setString(2, p.getPhone());
			ResultSet set = stmt.executeQuery();

			while (set.next()) {
				patient.setPid(set.getInt("pid")); // 환자 이름
				patient.setName(set.getString("name")); // 환자 이름
				patient.setGender(set.getString("gender")); // 환자 성별
				patient.setBirth(set.getString("birth")); // 환자 생일
				patient.setEmployee(getDoctor(set.getInt("employee_eid"))); // 의사
				patient.setCategory(getCategory(getDoctor(set.getInt("employee_eid")).getCatid())); // 진료과
				pid = set.getInt("pid");
			}

			stmt = con.prepareStatement("select * from indoors where patient_pid=" + pid);
			set = stmt.executeQuery();
			while (set.next()) {
				indoor.setId(set.getInt("id"));
				indoor.setDoor_start_day(set.getString("door_start_day")); // 입원
																			// 일자
				indoor.setDoor_end_day(set.getString("door_end_day")); // 퇴원 일자
			}

			stmt = con.prepareStatement(
					"select * from doctornote where patient_pid=" + pid + " order by day desc limit 1");
			set = stmt.executeQuery();
			while (set.next()) {
				dnid = set.getInt("dnid");
				doctornote.setDnid(set.getInt("dnid"));
				doctornote.setDay(set.getString("day")); // 진료 일자
				doctornote.setSymptom(set.getString("symptom")); // 증상
				doctornote.setNote(set.getString("note"));
			}

			stmt = con.prepareStatement("select * from prescription where doctornote_dnid=" + dnid);
			set = stmt.executeQuery();
			while (set.next()) {
				prescription.setPrid(set.getInt("prid"));
				prescription.setMname(set.getString("mname"));
				prescription.setHow_long(set.getInt("how_long"));
				prescription.setDay_dose(set.getInt("day_dose"));
				prescription.setOnce_dose(set.getInt("once_dose"));

				System.out.println("prescription " + prescription);
			}

			stmt = con.prepareStatement("select * from bill where patient_pid=" + pid);
			set = stmt.executeQuery();
			while (set.next()) {
				bill.setBid(set.getInt("bid"));
				bill.setDate(set.getString("date"));
				bill.setPrice(set.getInt("price"));
			}

			certificate.setPatient(patient);
			certificate.setDoctornote(doctornote);
			certificate.setIndoor(indoor);
			certificate.setPrescription(prescription);
			certificate.setBill(bill);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		System.out.println(certificate);
		return certificate;
	}

	public Medicine getMedicine(int mid) throws SQLException{
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM medicine WHERE mid=" + mid);
		stmt.setInt(1, mid);
		ResultSet set = stmt.executeQuery();
		
		Medicine med = new Medicine();
		if(!set.next()) return null;
		
		med.setMid(mid);
		med.setName(set.getString("name"));
		med.setType(set.getString("type"));
		
		return med;
			
	}
}