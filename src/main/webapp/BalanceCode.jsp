 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@ page import="java.sql.*" %>
    
<% try{
	long accountno=Long.parseLong(request.getParameter("ano"));
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
	PreparedStatement ps=con.prepareStatement("select*from bank where accountno=? and name=? and password=? ");
	ps.setLong(1,accountno);
	ps.setString(2,name);
	ps.setString(3,password);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
	ResultSetMetaData rsmd=rs.getMetaData();
	out.print("<center><div style=width:400;height:150>");
	out.print("</div></center>");
	out.print("<center><div style=background-colour :Blue (Crayola);width:400;height:150>");
	out.print("<html><body><center><table border ='1' style=width: 150px; height:150px;font-color:Cinnabar>");
	out.print("<center>"+"<h1 style=color:green>Welcome&ensp;"+name+"</h1>"+"</center>");
	int n=rsmd.getColumnCount();
	for(int i=1;i<=n;i++) 
		out.print("<th style=font-color: green><b><br>"+rsmd.getColumnName(i));
		out.println("</b></br><tr>");
		while(rs.next()) {
			for(int i=1;i<=n;i++) 
			
				out.println("<td><b><br>"+rs.getString(i));
				out.println("<tr>");
				out.println("");
				out.print("</div>");
	}
		out.println("</table></body></html>");
	}else{
		out.print("<center>"+"<h1 style=color:red>PLEASE ENTER VALID DETAILS &ensp;</h1>"+"</center>");
	}
	con.close();
	
}catch(Exception e){
	out.print("<center><div style=width:700px;height:90px></div></div>");
	out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
	out.print("<h1 style=color:red>"+e+"</h1>");
	out.print("</div></center>");
}
    
    
    
    
    %>
