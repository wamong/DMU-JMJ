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
<h3>개인정보 확인 </h3>
<br><br>
<a href='member4.html'>[등록하기]</a>

<TABLE border="1" width=600 cellpadding="5">
<TR align=center bgcolor=pink>
	<TD> 번호 </TD>
	<TD> 이름 </TD>
	<TD> 주소 </TD>
	<TD> 연락처 </TD>
</TR>
<%


try{
 String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";

    Class.forName(driverName);
    Connection con = DriverManager.getConnection(dbURL, "root", "dongyang");
	
	Statement stmt = con.createStatement();
	
	String strSQL = "SELECT * FROM tblMember4";
	ResultSet rs = stmt.executeQuery(strSQL);
	while(rs.next()){
		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String addr = rs.getString("addr");
		String tel = rs.getString("tel");
%>
<TR>
    
   <TD><%=listnum %></TD>
	<TD><a href="member_view4.jsp?num=<%=listnum %>">
	     <%=name %></a></TD>
	<TD><%=addr %></TD>
	<TD><%=tel %></TD>
</TR>
	
<%

	}
	rs.close();
	stmt.close();
	con.close();
}catch(SQLException ex){ }
 %>
</TABLE>

</body>
</html>