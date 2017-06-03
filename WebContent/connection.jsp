<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp?errorType=db" %>
    <%@ page import="java.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://loveljhs2.iptime.org:3306/hms","root","test");
 
%>