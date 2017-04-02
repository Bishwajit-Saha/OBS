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


/**
 *
 * @author sammita
 */
public class CreateServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String fullname=request.getParameter("fullname");
		String password=request.getParameter("password");
		String  repassword=request.getParameter("repassword");
		
		//String amoun=request.getParameter("amount");
		//double amount=Double.parseDouble(amoun);
		
		String address=request.getParameter("address");
		
		String ph=request.getParameter("phone");
		long phone=Long.valueOf(ph);
		//double mname=Double.parseDouble(num);
		//String country=request.getParameter("country");
		
	    int status=RegisterUser.register(username, fullname, password, repassword, address,phone);
	    
	   
	    
		if(status>0){

			request.setAttribute("res","USER SUCCESSFULLY CREATED!");
		}
		else if(status == -1){
			request.setAttribute("res","REGISTRATION FAILURE!");
		}
		else if(status == -50){
			request.setAttribute("res","USERNAME EXISTS! TRY WITH ANOTHER NAME");
		}
		RequestDispatcher rd=request.getRequestDispatcher("notification.jsp");
		rd.include(request, response);
		
	out.close();	
	}
    
}
