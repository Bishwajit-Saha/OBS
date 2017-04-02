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
public class RegisterAccount {
static int status=0;
//int accountno=1;
public static int register(String username,String password,double amount){
	//public static int register(String email,String password,String gender,String country,String name){

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
	if(status == 1){

		try{

			ps2 = con.prepareStatement("INSERT INTO users_account(username,balance) values(?,?)",Statement.RETURN_GENERATED_KEYS);
			ps2.setString(1,username);
			ps2.setDouble(2,amount);
			 status = ps2.executeUpdate();

			 ResultSet rs = ps2.getGeneratedKeys();
			if (rs.next()){
    			 String risultato=rs.getString(1);
    			System.out.println(username);
	}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	return status;
  }
}
