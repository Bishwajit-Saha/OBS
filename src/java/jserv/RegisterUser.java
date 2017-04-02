/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jserv;

/**
 *
 * @author sammita
 */
import java.sql.*;

import jserv.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(String username,String fullname,String password,String repassword,String address,long phone){
	//public static int register(String email,String password,String gender,String country,String name){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	int size =0;
	String sel = "Select * from users where username= ?";
	try{
		ps= con.prepareStatement(sel);
	    ps.setString(1, username);
	    ResultSet rs = ps.executeQuery();
	    while(rs.next()){
	    	size++;
	    }
	    if(size != 0)
	    	status = -50;
	}catch (SQLException e) {
		
		e.printStackTrace();
	}

	if(size == 0){


	try {
		ps = con.prepareStatement("Insert into users values(?,?,?,?,?)");
		//int	nextvalue1=GetCon.getPrimaryKey();

		System.out.println(username);
		ps.setString(1,username);
		ps.setString(2,fullname);
		ps.setString(3,password);
		//ps.setString(4,repassword);
		//ps.setDouble(5,amount);
		ps.setString(4,address);
		ps.setLong(5,phone);
		
		status=ps.executeUpdate();

		if(status <=0 && status!= -50){
			status = -1;
		}
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	
	}
	return status;
  }
}
