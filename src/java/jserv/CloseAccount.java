/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jserv;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


/**
 *
 * @author sammita
 */
public class CloseAccount extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=(String)request.getSession().getAttribute("username");
		//String fullname=request.getParameter("fullname");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		//String amoun=request.getParameter("amount");
		//double amount=Double.parseDouble(amoun);
		
		String account_no = request.getParameter("account_no");
	//	String address=request.getParameter("address");
		String risultato = "";
		//String acc_no="";
		//String ph=request.getParameter("phone");
	//	long phone=Long.valueOf(ph);
		//double mname=Double.parseDouble(num);
		//String country=request.getParameter("country");
		
	    //int status=RegisterAccount.register(username, password, amount);
	    int status = 0;
	    Connection con=GetCon.getCon();
	PreparedStatement ps,ps2;
	int size =0;
	String sel = "Select * from users where username= ?";
	try{
		ps= con.prepareStatement(sel);
	    ps.setString(1, username);
	    ResultSet rs = ps.executeQuery();
	    	    
	    
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
	}catch (SQLException e) {
		
		e.printStackTrace();
	}
	size = 0;
	if(status == 1){

		try{
			ps2 = con.prepareStatement("select amount from users_account where account_no = ?");
			ps2.setString(1,account_no);
			ResultSet rs3 = ps2.executeQuery();
			while(rs3.next()){
				double amount = rs3.getDouble("amount");
				System.out.println(amount);
				if (amount != 0.0){
					status = -20;
				}
				size++;
			}
			if(size == 0){
				status = -80;
			}
			if(status != -20 && status != -80){
				ps2 = con.prepareStatement("delete from users_account where account_no = ?");
				ps2.setString(1,account_no);
				status = ps2.executeUpdate();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}


		if(status>0){

			String res = "ACCOUNT SUCCESSFULLY CLOSED!";
			//res = res.concat(acc_no);
			request.setAttribute("res",res);
			
		}
		else if(status == -1){
			request.setAttribute("res","FAILURE! TRY AGAIN!");
		}
		else if(status == -50){
			request.setAttribute("res","USERNAME DOES NOT EXISTS! TRY WITH ANOTHER NAME!");
		}
		else if(status == -30){
			request.setAttribute("res", "PASSWORD INCORRECT!");
		}
		else if(status == -20){
			request.setAttribute("res","BALANCE NOT ZERO! WITHDRAW OR TRANSFER THE MONEY BEFORE CLOSING THE ACCOUNT");
		}
		else if(status == -80){
			request.setAttribute("res","ACCOUNT DOES NOT EXIST!");
		}
		RequestDispatcher rd=request.getRequestDispatcher("notification.jsp");
		rd.include(request, response);
		
	out.close();	
	}
    
}
