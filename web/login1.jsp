<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="jserv.*" %>



<%

int status = 0;
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        ResultSet rs2;
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
    if(status>0){

        session.setAttribute("username", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");

    }
    else if(status == -30){

        request.setAttribute("res","PASSWORD IS INCORRECT!");
        RequestDispatcher rd=request.getRequestDispatcher("notification.jsp");
        rd.include(request, response);
    }
    else{

        request.setAttribute("res","USER DOES NOT EXIST!");
        RequestDispatcher rd=request.getRequestDispatcher("notification.jsp");
        rd.include(request, response);

   }
%>