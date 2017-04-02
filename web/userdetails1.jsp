<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>NIT - BANK<span class="style1"></span></h1>
    <h2>On-time Service</h2>	
</div>

<div id="navigation">
    <ul>
    <li><a href="newuser.jsp">NEW USER</a></li>
    <li><a href="create.jsp">NEW ACCOUNT</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="userdetails.jsp">USER DETAILS</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <p>24*7 transactions online</p>
            <p>Expert advice for house loans</p>
			
       </div>
	</td>
    
    <td width="2400" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>USER ACCOUNTS</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
			
		</tr>
    	<td width="2400" valign="top">
<%
    	
        //String account_no=request.getParameter("account_no");
		
		int status = 0;
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		ResultSet rs2;
		//System.out.println(username);
		//String num1=request.getParameter("taccountno");
		//int taccountno=Integer.parseInt(num1);
		
		//String amoun=request.getParameter("amount");
		//int accoun=Integer.parseInt(amoun);
		//accountno=taccountno;
	    String sel = "Select * from users where username= ?";
		try{
			Connection con=GetCon.getCon();
			int size = 0;
			
		 	PreparedStatement ps= con.prepareStatement(sel);
	    	ps.setString(1, username);
	    	ResultSet rs = ps.executeQuery();
	    	//System.out.println(rs);    
	    	while(rs.next()){
	    		
	    		size++;
	    		String pass = rs.getString("password");
	    		if(pass.equals(password)){
	    			status = 1;
	    		}
	    		else
	    			status = -30;
	    	}

	    if(size == 0){
	    	status = -50;
	    }
	    System.out.println(status);
	}catch (SQLException e) {
		
		e.printStackTrace();
	}
	if(status > 0){
		Connection con=GetCon.getCon();
		PreparedStatement ps2 = con.prepareStatement("select account_no,amount from users_account where username = ?");
		ps2.setString(1,username);
		rs2 = ps2.executeQuery();

		    out.print("<table align='left' width='90%' border='4' >");
			out.print("<tr><th>ACCOUNT NO</th><th>AMOUNT</th></tr>");
			while(rs2.next()){
				
				out.print("<tr>");
				out.print("<td>" + rs2.getString(1) + "</td>");
				out.print("<td>" + rs2.getDouble(2) + "</td>");
				out.print("</tr>");
				System.out.println(rs2);
			
			}
			out.print("</table>");

	}
	%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="jserv.*" %>


   
