<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
    <%  
    try{
    	long accountno=Long.parseLong(request.getParameter("ano"));
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		long taccountno=Long.parseLong(request.getParameter("tano"));
		double amount=Double.parseDouble(request.getParameter("amt"));
		
		
		double temp=amount;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
		PreparedStatement ps=con.prepareStatement("select amount from bank where accountno=? and name=? and password=? ");
		ps.setLong(1,accountno);
		ps.setString(2,name);
		ps.setString(3,password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			boolean flag=false;
			if(amount<=rs.getDouble(1)){
				out.print("<center><allign:><div style=width:400px;height:70px></div></div>");
				out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
				out.print("<h1 style=color:green>AMOUNT DEDUCTED "+amount+"</h1>");
				amount-=rs.getDouble(1);
				flag=true;
				PreparedStatement ps1=con.prepareStatement("update bank set amount=? where accountno=?");
				ps1.setDouble(1,amount);
				ps1.setLong(2,accountno);
				out.print("<h1 style=color:green> AMOUNT TANSFERED</h1>");
				out.print("<h1 style=color:green> REMINING AMOUNT "+amount+"</h1>");
				
			
			accountno=taccountno;
			PreparedStatement ps2=con.prepareStatement("select * from bank where accountno=?  ");
			ps.setLong(1,accountno);
			ResultSet rs1=ps2.executeQuery(); 
			if (rs1.next()){ 
				amount=temp;
				amount+=rs1.getDouble(1);
			out.print("<center><allign:><div style=width:400px;height:90px></div></div>");
			out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
			out.print("<h1 style=color:green>TRANSFER AMOUNT</h1>");
			PreparedStatement ps3=con.prepareStatement("update bank set amount=? where accountno=?  ");
			ps3.setDouble(1,amount);
			ps3.setLong(2,accountno);
			}
			}
			if(!flag){
				out.print("<center><div style=width:400px;height:90px></div></div>");
				out.print("<center> <div style=bgcolor:#ccccdd;width:400;height:150>");
				out.print("<h1 style=color:green>INSUFFIENT FUNDS</h1></div></center>");
			}
		}else{
			out.print("<center><div style=width:400px;height:90px><h1 style=color:red><b> PLEASE ENTER VALID DETIALS</b> </h1></div></center>");
		}
			
		con.close();
		
    
    }	catch(Exception e){
    	out.print("<center><div style=width:700px;height:90px></div></div>");
    	out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
    	out.print("<h1 style=color:red>"+e+"</h1>");
    	out.print("</div></center>");
    }

  /*  try{
    	long accountno=Long.parseLong(request.getParameter("ano"));
		String name=request.getParameter("uname");
		String password=request.getParameter("psw");
		double amount=Double.parseDouble(request.getParameter("amt"));
		long transferaccount=Long.parseLong(request.getParameter("tano"));
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","vamsi","vamsi");
		
		}
		
		
	}catch(Exception e){
		out.print("<center><div style=width:700px;height:90px></div></div>");
		out.print("<center> <div style=bgcolor:#ccccdd;width:400px;height:150px>");
		out.print("<h1 style=color:red>"+e+"</h1>");
		out.print("</div></center>");
	}
	*/



 					%>
		