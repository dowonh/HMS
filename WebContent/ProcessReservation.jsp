<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
������!!!!!!!!!!!!!!!!!!!!

<%
	request.setCharacterEncoding("euc-kr");

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
	alert("���Ό���� �Ǿ����ϴ�.");
</script>

</body>
</html>