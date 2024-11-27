<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정중</title>
</head>
<body>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<SCRIPT language="JavaScript">
function Check()
{
if (Modify.name.value.length < 1) {
	alert("작성자를 입력하세요.");
	Modify.name.focus(); 
        return false;
	}

if (Modify.pass.value.length < 1) {
	alert("비밀번호를 입력하세요.");
	Modify.pass.focus(); 
	return false;
	}

if (Modify.addr.value.length <1 )
	{ 
		alert("주소를 입력하세요.");
		Modify.addr.focus();
		return false;
	}

if (Modify.tel.value.length < 1) {
	alert("전화번호를 입력하세요.");
	Modify.tel.focus(); 
	return false;
        }

Modify.submit();
}

function list()
{
location.href = "member_out4.jsp";
}

</SCRIPT>
</HEAD>

<BODY>

<%
String num = request.getParameter("num"); 

String driverName = "com.mysql.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/test";

Class.forName(driverName);
Connection con = DriverManager.getConnection(dbURL, "root", "dongyang");

PreparedStatement pstmt = null;
ResultSet rs = null;

try {

String strSQL = "SELECT * FROM tblMember4 WHERE num = ?";
pstmt = con.prepareStatement(strSQL);
pstmt.setInt(1, Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String name = rs.getString("name");
String addr = rs.getString("addr");
String tel = rs.getString("tel");
%>
                   
<center><font size='3'><b> 수정 </b></font>                  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>
                 
<FORM Name='Modify' Action='member_mody_out4.jsp' Method='POST' OnSubmit='return Check()'>
<input type='hidden' name='num' value='<%=num %>'>
      
<TABLE border='0' width='600'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>작성자</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' value="<%=name %>"> * 필수 </p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * 필수 </p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>주소</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='addr' value="<%=addr %>"></font>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>전화번호</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='tel' value="<%=tel %>"></font>
		</TD>
	</TR>

	
	<TR>
		<TD colspan='2'><hr size='1' noshade></TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='200' align='center'>
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Button' Value = '수 정 완료' Name='Page' onClick='Check();'>
				</TD>
				
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

<%
}catch(SQLException e){
   	out.print("SQL에러 " + e.toString());
}catch(Exception ex){
   	out.print("JSP에러 " + ex.toString());
}finally{  
	rs.close();
	pstmt.close();
	con.close();
}
%>
</body>
</html>