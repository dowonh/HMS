package hmsControllers;

import hmsDA.HmsDA;
import hmsModels.Category;
import hmsModels.doctornote;
import hmsModels.Employee;
import hmsModels.Medicine;
import hmsModels.MedicineGoods;
import hmsModels.Patient;
import hmsModels.Prescription;
import hmsModels.Room;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/Process")
public class Process extends HttpServlet {
	
	HmsDA hms = new HmsDA();
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		try {
			processRequest(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		try {
			processRequest(request,response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException{
		try{
			
			if(request.getParameter("action")!=null) {
				if(request.getParameter("action").equals("addDoc")){
					addDoc(request,response);
				} //else if(request.getParameter("action").equals("addNurse"))
//					addNurse(request,response);
				else if(request.getParameter("action").equals("addRoom")){
					addRoom(request,response);
				}
//				else if(request.getParameter("action").equals("addPatient"))
//					addPatient(request,response);
				else if(request.getParameter("id")!=null){
//					else if(request.getParameter("action").equals("deletePatient"))
//						deletePatient(request,response);
//
					if(request.getParameter("action").equals("getDoc"))
						getDoc(request,response);
					else if(request.getParameter("action").equals("editDoc"))
						updateDoc(request,response);
					else if(request.getParameter("action").equals("deleteEmp"))
						deleteEmployee(request,response);
					else if(request.getParameter("action").equals("getRoom"))
						getRoom(request,response);
					else if(request.getParameter("action").equals("editRoom"))
						updateRoom(request,response);
					else if(request.getParameter("action").equals("deleteRoom"))
						deleteRoom(request,response);
//					else if(request.getParameter("action").equals("getNurse"))
//						getNurse(request,response);
//					else if(request.getParameter("action").equals("editNurse"))
//						updateNurse(request,response);

//					else
//						request.getRequestDispatcher("index.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} else{
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} 
		} catch(SQLException ex){
			System.out.print(ex.getMessage());
			response.setStatus(ex.getErrorCode());
			response.setContentType("text/plain");
			response.getWriter().print(ex.getMessage());
			return;
		} catch(NumberFormatException e){
			response.setContentType("text/plain");
			response.getWriter().print(e.getMessage());
		} catch(IOException e){
		 	e.printStackTrace();
		} catch(ServletException ex){
			ex.printStackTrace();
		}
	}
	//---------------------------
	// 어드민 닥터부분
	//---------------------------
	private void addDoc(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		
		int catid = Integer.parseInt(request.getParameter("catid"));
		int salary = Integer.parseInt(request.getParameter("salary"));
 
		Employee employee = new Employee();
		employee.setName(request.getParameter("name"));
		employee.setUsername(request.getParameter("username"));
		employee.setPasswd(request.getParameter("password"));
		employee.setGender(request.getParameter("gender"));
		employee.setBirth(request.getParameter("birth"));
		employee.setPhone(request.getParameter("phone"));
		employee.setSalary(salary);
		employee.setType("doctor");
		employee.setCatid(catid);
 
		hms.addDoctor(employee);
	    response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.setContentType("application/json");
		response.getWriter().print(employee.toJson());
		
	}
	
	public void updateDoc(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		int eid = Integer.parseInt(request.getParameter("id"));
		int catid = Integer.parseInt(request.getParameter("catid"));
		
		int salary = Integer.parseInt(request.getParameter("salary"));
 
		Employee employee = new Employee();
		employee.setEid(eid);
		employee.setName(request.getParameter("name"));
		employee.setUsername(request.getParameter("username"));
		employee.setPasswd(request.getParameter("password"));
		employee.setGender(request.getParameter("gender"));
		employee.setBirth(request.getParameter("birth"));
		employee.setPhone(request.getParameter("phone"));
		employee.setSalary(salary);
		employee.setType("doctor");
		employee.setCatid(catid);
		
		hms.updateDoctor(employee);
//		response.setCharacterEncoding("UTF8"); // this line solves the problem
//		response.setContentType("application/json");
//		response.getWriter().print(employee.toJson());
	}
  
	public void getDoc(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		int eid = Integer.parseInt(request.getParameter("id"));

		Employee emp = hms.getDoctor(eid); 
		
		response.setContentType("application/json");
	    response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.getWriter().print(emp.toJson());
	}
	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
	
		int eid = Integer.parseInt(request.getParameter("id"));
		hms.deleteEmployee(eid);
	}
	//---------------------------
	// 어드민 방 정보 부분
	//---------------------------
	public void addRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		
		int room_number = Integer.parseInt(request.getParameter("room_number"));
		int totalbeds = Integer.parseInt(request.getParameter("totalbeds"));
		
		Room room = new Room();
		room.setRoom_number(room_number);
		room.setTotalbeds(totalbeds);
		room.setAvailablebeds(totalbeds);
		hms.addRoom(room);
		
		response.setContentType("application/json");
		response.getWriter().print(room.toJson());
	}
	public void getRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		int rid = Integer.parseInt(request.getParameter("id"));
	
		Room room = hms.getRoom(rid);
	
		response.setContentType("application/json");
		response.getWriter().print(room.toJson());
	
	}
	public void updateRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, NumberFormatException, SQLException{
	
		int rid = Integer.parseInt(request.getParameter("id"));

		Room room = hms.getRoom(rid);
		room.setTotalbeds(Integer.parseInt(request.getParameter("totalbeds")));
		
		hms.updateRoom(room);
		
		response.setContentType("application/json");
		response.getWriter().print(room.toJson());
	}
	public void deleteRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		int rid = Integer.parseInt(request.getParameter("id"));
		hms.deleteRoom(rid);
	}

//	
//	
//	public void updateNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, NumberFormatException, SQLException{
//		
//		Nurse nurse = hms.getNurse(Integer.parseInt(request.getParameter("id")));
//		Employee employee = nurse.getEmployee();
//		User user = employee.getUser();
//		
//		
//		user.setUsername(request.getParameter("username"));
//		user.setPassword(request.getParameter("password"));
//		user.setType("doctor");
//		//hms.updateUser(user);
//		
//		
//		employee.setFirstname(request.getParameter("firstname"));
//		employee.setLastname(request.getParameter("lastname"));
//		employee.setSalary(Integer.parseInt(request.getParameter("salary")));
//		employee.setPhone(request.getParameter("phone"));
//		employee.setGender(request.getParameter("gender"));
//		employee.setDob(request.getParameter("dob"));
//		employee.setUid(user.getUid());
//		//hms.updateEmployee(employee);
//		
//		
//		nurse.setExperience(request.getParameter("experience"));
//		nurse.setEid(employee.getEid());
//		hms.updateNurse(nurse);
//		
//		response.setContentType("application/json");
//		response.getWriter().print(nurse.toJson());
//		
//	}
//	
//	

//	
//	
//	
//	public void getNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
//		
//		int nid = Integer.parseInt(request.getParameter("id"));
//		
//		Nurse nurse = hms.getNurse(nid);
//		
//		response.setContentType("application/json");
//		response.getWriter().print(nurse.toJson());
//		
//	}
//	
//	
//	public void addPatient(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
//		String fullName = request.getParameter("fullname");
//		String gender = request.getParameter("gender");
//		String dob = request.getParameter("dob");
//		int catid = Integer.parseInt(request.getParameter("catid"));
//		
//		Patient p = new Patient();
//		p.setName(fullName);
//		p.setGender(gender);
//		p.setDob(dob);
//		p.setCatid(catid);
//		
//		hms.addPatient(p);
//		
//	}
//	
//	public void deletePatient(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
//		
//		int pid = Integer.parseInt(request.getParameter("id"));
//		hms.deletePatient(pid);
//
//	}
//	

//	

//	

//	

//	
//	public void addNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
//		
//		User user = new User();
//		user.setUsername(request.getParameter("username"));
//		user.setPassword(request.getParameter("password"));
//		user.setType("nurse");
//		//int uid = hms.addUser(nurseUser);
//		
//		Employee employee = new Employee();
//		employee.setFirstname(request.getParameter("firstname"));
//		employee.setLastname(request.getParameter("lastname"));
//		employee.setSalary(Integer.parseInt(request.getParameter("salary")));
//		employee.setPhone(request.getParameter("phone"));
//		employee.setGender("female");
//		employee.setDob(request.getParameter("dob"));
//		employee.setUser(user);
//		//employee.setUid(uid);
//		//int eid = hms.addEmployee(employee);
//		
//		
//		Nurse nurse = new Nurse();
//		//nurse.setEid(eid);
//		nurse.setExperience(request.getParameter("experience"));
//		nurse.setEmployee(employee);
//		int nid = hms.addNurse(nurse);
//			
//			
//			
//
//			response.setContentType("application/json");
//			response.getWriter().print(nurse.toJson());
//		
//	}

}
