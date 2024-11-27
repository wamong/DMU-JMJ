<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
int num  = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";

    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbURL, "root", "dongyang");


PreparedStatement pstmt = null;

pstmt = con.prepareStatement("UPDATE tblMember4 SET name=?, pass=?, addr=?, tel=? WHERE num=?");
pstmt.setString(1, name);
pstmt.setString(2, pass);
pstmt.setString(3, addr);
pstmt.setString(4, tel);
pstmt.setInt(5, num);
pstmt.executeUpdate();

pstmt.close();
con.close();

response.sendRedirect("member_out4.jsp");
%>
</body>
</html>