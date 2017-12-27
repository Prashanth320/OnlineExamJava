<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import='java.sql.*' %>
<%
try
{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott", "tiger");
	String aa=request.getParameter("questionCount");
	String bb=request.getParameter("qu");
	System.out.println(aa);
	System.out.println(bb);
    int i=Integer.parseInt(aa);
    int k=0;
    String answer=" ";
    int x=0;
	for(k=0; k<i; k++)
	{
	  	String a=request.getParameter("radio"+k);
	  	//answer=answer+"$"+a;
	  	String query="insert into answer(ans) values('"+a+"')";
		PreparedStatement pst=connection.prepareStatement(query);
		x=pst.executeUpdate();
		connection.commit();
	}
	/* String query="insert into answer(ans) values('"+answer+"')";
	PreparedStatement pst=connection.prepareStatement(query);
	int x=pst.executeUpdate();
	*/
	 {
		if(x>0)
		{
			out.println("Thanks for giving the Online Exam, Your Result is updated soon");
		}
		else
		{
			out.println("failed");
		}
	}
}
catch(Exception e)
{
	System.out.println(e.toString());
}
%>
</body>
</html>