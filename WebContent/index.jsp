<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.sql.*" %>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	PreparedStatement ps=con.prepareStatement("select * from javalanguage");
	ResultSet rs=ps.executeQuery();
%>
<form action="" method="post">

<%
while(rs.next())
{
	%>
	<br>
<%=rs.getInt("quesno")%> &nbsp;&nbsp;&nbsp; <%=rs.getString("question") %><br><br>
<input type="radio" name="question" value="a"><%=rs.getString("ans1") %>&nbsp;&nbsp;
<input type="radio" name="question" value="b"><%=rs.getString("ans2") %>&nbsp;&nbsp;
<input type="radio" name="question" value="c"><%=rs.getString("ans3") %>&nbsp;&nbsp;
<input type="radio" name="question" value="d"><%=rs.getString("ans4") %>&nbsp;&nbsp;<br><br>
<%
}

%>
<input type="submit" value="SUBMIT">
</form>
<%
}
catch(Exception e)
{
	System.out.println(e.toString());
}


%>

</body>
</html>