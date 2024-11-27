<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
	
<%
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

try{
    String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";

    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbURL, "root", "dongyang");

   Statement stmt = con.createStatement();

PreparedStatement pstmt1 = null, pstmt2 = null;

String strSQL = "SELECT Max(num) FROM tblMember4";
pstmt1 = con.prepareStatement(strSQL);
ResultSet rs = pstmt1.executeQuery();
int num = 0;

if (num==0){
	rs.next();
	num = rs.getInt(1) + 1;	
}

rs.close();
	

strSQL ="INSERT INTO tblMember4(num,name,pass,addr,tel)";
strSQL = strSQL + "VALUES (?, ?, ?,?,?)";
pstmt2 = con.prepareStatement(strSQL);

pstmt2.setInt(1, num);
pstmt2.setString(2, name);
pstmt2.setString(3, pass);
pstmt2.setString(4, addr);
pstmt2.setString(5, tel);
pstmt2.executeUpdate();

}catch(SQLException ex){}
%>

성공적으로 저장되었습니다.
<br><br>
<a href="member_out4.jsp">결과확인</a>

</body>
</html>