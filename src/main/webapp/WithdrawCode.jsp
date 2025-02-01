<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    <% try{
    	long accountno=Long.parseLong(request.getParameter("ano"));
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		double amount=Double.parseDouble(request.getParameter("amt"));
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
		PreparedStatement ps=con.prepareStatement("select amount from bank where accountno=? and name=? and password=? ");
		ps.setLong(1,accountno);
		ps.setString(2,name);
		ps.setString(3,password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			if(amount<rs.getDouble(1)){
			out.print("<center><div style=width:400px;height:90px></div></div>");
			out.print("<center> <div style=bgcolor:#ccccdd;width:400;height:150>");
			out.print("<h1 style=color:green>YOUR ACCOUNT BALANCE HAS DEBITED BY"+amount+"</h1>");
			amount-=rs.getDouble(1);
			out.print("<h1 style=color:green>YOUR ACCOUNT BALANCE IS "+amount+"</h1>");
			out.print("</div>");
			}else{
				out.print("<center><div style=width:400;height:90></div></div>");
				out.print("<center> <div style=bgcolor:#ccccdd;width:400;height:150>");
				out.print("<center><h2 style=color:green>INSUFFINT FUNNDS</h2>");
				out.print("<h3 style=color:green>YOUR ACCOUNT BALANCE "+amount+"</h3>");
				
			}
		}
		PreparedStatement ps1=con.prepareStatement("update bank set amount=? where accountno=? ");
		ps1.setDouble(1,amount);
		ps1.setLong(2,accountno);
		ps1.executeUpdate();
		
		
		
		
		
		
		con.close();
		
    }catch(Exception e){
    	out.print("<h1 style=color:red>"+e+"</h1>");
    }





%>
