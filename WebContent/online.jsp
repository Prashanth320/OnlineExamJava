<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.sql.*"%>

<form method="post" action="result.jsp">
<table>
<%
Class.forName("oracle.jdbc.OracleDriver");
Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott", "tiger");
Statement st=connection.createStatement();
ResultSet rs=st.executeQuery("Select * from javalanguage");
int i=0;
int j=0;
String ques;
//int x=1;


while(rs.next()){
	 ques=rs.getString("quesno");
	//System.out.println(ques);
%>
<tr>
	
    <td><% out.println(ques); %></td><td><%=rs.getString("question")%></td>
	<td><input type="radio" value="<%=rs.getString("ans1")%>" name="radio<%=i%>"/><%=rs.getString("ans1")%></td>
	<td><input type="radio" value="<%=rs.getString("ans2")%>" name="radio<%=i%>"/><%=rs.getString("ans2")%></td>
	<td><input type="radio" value="<%=rs.getString("ans3")%>" name="radio<%=i%>"/><%=rs.getString("ans3")%></td>
	<td><input type="radio" value="<%=rs.getString("ans4")%>" name="radio<%=i%>"/><%=rs.getString("ans4")%></td>
	
 </tr>
<input type='hidden' name='qu' value="<%=ques%>">
<%
i++;
j++;
//x++;
}
%>

 <input type='hidden' name='questionCount' value='<%=i%>' >
<tr><td><input type="submit" value="submit"></td></tr>
</table>
</form>

</body>
</html>