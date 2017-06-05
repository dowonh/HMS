<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
데이터!!!!!!!!!!!!!!!!!!!!

<%
	

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String department = request.getParameter("department");
	String doctor = request.getParameter("doctor");
	String date = request.getParameter("reservation_date");
	String time = request.getParameter("reservation_time");
	
%>

<%=name %>
<%=phone %>
<%=department %>
<%=doctor %>
<%=date %>
<%=time %>

<script type="text/javascript">
	alert("진료예약이 되었습니다.");
</script>

</body>
</html>