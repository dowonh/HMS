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
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
/**
 * Servlet implementation class EditEmployee
 */
@WebServlet("/Process")
public class Process extends HttpServlet {
	
	HmsDA hms = new HmsDA();
	private static Gson g = new Gson();
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

				} else if(request.getParameter("action").equals("addNurse"))
					addNurse(request,response);
				else if(request.getParameter("action").equals("addRoom"))
					addRoom(request,response);
				else if(request.getParameter("action").equals("addPatient"))
					addPatient(request,response);
				else if(request.getParameter("action").equals("reservationCheck"))
					reservationCheck(request,response);
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
					else if(request.getParameter("action").equals("getNurse"))
						getNurse(request,response);
					else if(request.getParameter("action").equals("editNurse"))
						updateNurse(request,response);
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
		employee.setCategory(hms.getCategory(catid));
		
		hms.updateDoctor(employee);
		response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.setContentType("application/json");
		response.getWriter().print(employee.toJson());
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
	// 간호사 부분
	//---------------------------
	public void addNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {

		Employee employee = new Employee();
		int cid = hms.getCategoryID("간호사");
		
		employee.setName(request.getParameter("name"));
		employee.setUsername(request.getParameter("username"));
		employee.setPasswd(request.getParameter("password"));
		employee.setGender(request.getParameter("gender"));
		employee.setBirth(request.getParameter("birth"));
		employee.setPhone(request.getParameter("phone"));
		employee.setSalary(Integer.parseInt(request.getParameter("salary")));
		employee.setType("nurse");
		employee.setCatid(cid);
		int nid = hms.addNurse(employee);

		response.setContentType("application/json");
		response.getWriter().print(employee.toJson());

	}
	
	public void getNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		
		int nid = Integer.parseInt(request.getParameter("id"));
		
		Employee nurse = hms.getNurse(nid);
		response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.setContentType("application/json");
		response.getWriter().print(nurse.toJson());
		
	}
	
	public void updateNurse(HttpServletRequest request, HttpServletResponse response) throws IOException, NumberFormatException, SQLException {

		int eid = Integer.parseInt(request.getParameter("id"));
		int catid = hms.getCategoryID("간호사");
		int salary = Integer.parseInt(request.getParameter("salary"));
 
		Employee nurse = new Employee();
		nurse.setEid(eid);
		nurse.setName(request.getParameter("name"));
		nurse.setUsername(request.getParameter("username"));
		nurse.setPasswd(request.getParameter("password"));
		nurse.setGender(request.getParameter("gender"));
		nurse.setBirth(request.getParameter("birth"));
		nurse.setPhone(request.getParameter("phone"));
		nurse.setSalary(salary);
		nurse.setType("nurse");
		nurse.setCatid(catid);
 
		hms.updateNurse(nurse);
		response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.setContentType("application/json");
		response.getWriter().print(nurse.toJson());

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
	
	//예약시스템쪽
	public void addPatient(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		System.out.println(name);
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String phone = request.getParameter("phone"); 
		int eid = Integer.parseInt(request.getParameter("doctor"));
		String reservation_date = request.getParameter("reservation_date");
		String reservation_time = request.getParameter("reservation_time");
		
		Patient p = new Patient();
		p.setName(name);
		p.setGender(gender);
		p.setPhone(phone);
		p.setBirth(dob);
		p.setEid(eid);
		p.setReservation_day(reservation_date);
		p.setReservation_time(reservation_time);	
		
		hms.addPatient(p);
	}
	
	//예약시스템쪽
	public void reservationCheck(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		
		System.out.println("넘어오냐?");
		
		request.setCharacterEncoding("utf-8");
			
		String name = request.getParameter("name");
		String phone = request.getParameter("phone"); 

		Patient p = new Patient();
		p.setName(name);			
		p.setPhone(phone);
	
		ArrayList<Patient> patientInfo = hms.reservationCheck(p);
		response.setCharacterEncoding("UTF8"); // this line solves the problem
		response.setContentType("application/json");
		response.getWriter().print(g.toJson(patientInfo));
	}

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
 

}
