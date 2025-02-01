<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    <% 
try{
	long accountno=Long.parseLong(request.getParameter("ano"));
	String name=request.getParameter("uname");
	String password=request.getParameter("psw");
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
			PreparedStatement ps=con.prepareStatement("delete from bank where name=? and password=? and accountno=?");
			
			ps.setString(1,name);
			ps.setString(2,password);
			ps.setLong(3,accountno);			
			ResultSet rs=ps.executeQuery();
			boolean flag =false;
			if(rs.next()){
				
				out.print("<center><div style=width:700;height:90></div></div>");
				out.print("<center> <div style=bgcolor:#ccccdd;width:400;height:150>");
				out.print("<center><h1 style=color: green> YOUR ACCOUNT SUCCESSFULLY REMOVED </h1></center>");
				out.print("</div></center>");
				flag=true;
				
			}
			if(!flag){
				out.print("<center><div style=width:700;height:90></div></div>");
				out.print("<center> <div style=bgcolor:#ccccdd;width:400;height:150>");
				out.print("<center><h1 style=color: green> COULD'NT FIND YOUR ACCOUNT </h1></center>");
				out.print("</div></center>");
			}
			con.close();
			
		}
		catch(Exception e) {
			out.print("<center><div style=width:700px;height:90px></div></div>");
			out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
			out.print("<h1 style=color:red>"+e+"</h1>");
			out.print("</div></center>");
		}
		
		%>