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
    <li><a href="logout.jsp">LOGOUT</a></li>
    <li><a href="create.jsp">NEW ACCOUNT</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="userdetails1.jsp">USER DETAILS</a></li>
    </ul>
</div>

<%
    	
        //String account_no=request.getParameter("account_no");
		
		int status = 0;
        String username=(String)request.getSession().getAttribute("username");
		//String password=request.getParameter("password");
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
	    		
	    		out.print("<h1 style='text-align: center'>USER DETAILS</h1>");
	    		out.print("<h2 style='text-align: center'>USER ACCOUNT AND PERSONAL DETAILS</h2>");
	    		out.print("<table width='100%' border='4' bgcolor='#FFFFFF'>");
			    out.print("<tr><th>FULLNAME</th><th>PHONE</th><th>ADDRESS</th></tr>");
			    out.print("<tr>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getLong(5) + "</td>");
				out.print("<td>" + rs.getString(4) + "</td>");
				out.print("</tr>");
				out.print("<br><br><br><br>");
				out.print("</table>");
	    	}

	    if(size == 0){
	    	status = -50;
	    }
	    //System.out.println(status);
	}catch (SQLException e) {
		
		e.printStackTrace();
	}
	if(status != 0){
		Connection con=GetCon.getCon();
		PreparedStatement ps2 = con.prepareStatement("select account_no,amount from users_account where username = ?");
		ps2.setString(1,username);
		rs2 = ps2.executeQuery();

		    out.print("<table width='100%' border='4' bgcolor='#FFFFFF'>");
			out.print("<tr><th>ACCOUNT NO</th><th>AMOUNT</th></tr>");
			while(rs2.next()){
				
				out.print("<tr>");
				out.print("<td>" + rs2.getString(1) + "</td>");
				out.print("<td>" + rs2.getDouble(2) + "</td>");
				out.print("</tr>");

				//System.out.println(rs2);
			
			}
			out.print("<br>");
			out.print("</table>");

	}
	%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="jserv.*" %>


   
