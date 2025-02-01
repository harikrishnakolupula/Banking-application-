<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<%

	try{
		long accountno=Long.parseLong(request.getParameter("ano"));
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		String cpassword=request.getParameter("psw1");
		double amount=Double.parseDouble(request.getParameter("amt"));
		String address=request.getParameter("add");
		long mobileno=Long.parseLong(request.getParameter("pno"));
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
		PreparedStatement ps=con.prepareStatement("insert into bank values(?,?,?,?,?,?,?)");
		ps.setLong(1,accountno);
		ps.setString(2,name);
		ps.setString(3,password);
		ps.setString(4,cpassword);
		ps.setDouble(5,amount);
		ps.setString(6,address);
		ps.setLong(7,mobileno);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			if(password .equals(cpassword)){
			out.print("<center><div style =float-left;width:400px;height:90px>");
			out.print("</div></center>");
			out.print("<center><div style =background-color:silver;width:700px;height:200px>");
			out.print("<table border=1>");
			out.print("<td style=color:green><h1><fontstyle=boston;>"+"YOUR REGISTERATION SUCCESSFULLY "+"</forntstyle></h1>"+"</td>");
			out.print("<td><h2><a href=balance.jsp>"+"CHECK BALANCE"+"</a></h2></td>");
			out.print("</div></center>");
			PreparedStatement ps1=con.prepareStatement("commit");
			ps1.executeQuery();
		}else{
			out.print("<div style =color :silver;width:100px;height:90px>");
			out.print("<h2 style=colour:red;fontstyle:boston;>.PLEASE MAKE SURE THAT PASSWORD AND CONFORM PASSWORD SHOULD BE EQUAL. </h2>");
			out.print("</div>");
			PreparedStatement ps2=con.prepareStatement("delete from bank where password=?");
			ps2.setString(1,password);
			ps2.executeUpdate();
		}
		}else{
			out.print("<h3 style=colour:red;fontstyle:boston;>YOUR REGISTERATION FAILED </h3>");
		}
		
		con.close();
	}catch(Exception e){
		out.print("<center><div style=width:700px;height:90px></div></div>");
		out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
		out.print("<h1 style=color:red>"+e+"</h1>");
		out.print("</div></center>");
		
	}





%>