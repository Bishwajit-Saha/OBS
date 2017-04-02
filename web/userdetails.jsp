


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
{
  for(var i=0; i<3; i++)
   {
        if(!isNaN(form.elements[i].value))
        {
           alert("This Field must be Char's")
           form.elements[i].value=""    
           form.elements[i].focus()
           return false
        }
   } 
    if(document.F1.password.value!=document.F1.repassword.value)
    {
       alert("Check Confirm PWD"); 
       document.F1.repassword.value=""
       document.F1.repassword.focus()   
       return false
    }
    
    
    /if(!isNaN(document.F1.phone.value))
   {
       if(document.F1.phone.value >9999999999 )
       {
         alert("Not possible")
         document.F1.phone.value=""
         document.F1.phone.focus()
         return false   
       }
   }
   else
   {
       alert("This  field  must  be  number")
       document.F1.phone.value=""
       return false
   }
    
    
    

   if(!isNaN(document.F1.amount.value))
   {
       if(document.F1.amount.value < 500)
       {
         alert("Minimum Balance should be 500 /-")
         document.F1.amount.value=""
         document.F1.amount.focus()
         return false   
       }
   }
   else
   {
       alert("This  field  must  be  number")
       document.F1.amount.value=""
       return false
   }/
   
   

   for(var i=0; i<form.elements.length; i++)
   {
        if(form.elements[i].value == "")
        {
           alert("Fill out all Fields")
           document.F1.username.focus()
           return false
        }
   }

   

   return true   
   }
</SCRIPT>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>NIT Bank</title>
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
    <A href="index.jsp"><IMG SRC="images/home1.gif"></IMG></A>  
</div>

<div id="navigation">
    <ul>
    <li><a href="createuser.jsp">NEW USER <li>
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
    
    <td width="1200" valign="top">
        <div id="welcome" style="border-right:#666666 1px dotted;"><h1>USER ACCOUNTS</h1><br>
            <table  align="center" bgcolor="white">
        <tr>
            
        </tr>
        <tr>
            <td>
                <form name=F1 onSubmit="return dil(this)" action="userdetails1.jsp" >
                  <table cellspacing="5" cellpadding="3">   
                
                    <tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
                    <tr><td>PASSWORD:</td><td> <input type="password" name="password"/></td></tr>
                    <tr><td>RE-PASSWORD:</td><td> <input type="password" name="repassword"/></td></tr>
        
                    <!-- Gender:<br/><br/>
                    Male<input type="radio" name="gender" value="male"> Female<input type="radio" name="gender" value="female"/><br/><br/> -->
                    <tr><td></td><td><input type="submit" value="Submit"/>
                    
                    <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
                    </table>
                    </form>
            </td>
        </tr>
    
    </table>
           </div>      
    </td>
    
   <td width="299" valign="top">
        <div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
            <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
            <p>NIT Bank welcomes you to explore the world of premier bank in India. In this section, you can access detailed information on Overview of the Bank, Technology Upgradation in the Bank, Board of Directors, Financial Results and Shareholder Info.
The Bank is actively involved since 2017 in non-profit activity called Community Services Banking. All our branches and administrative offices throughout the country sponsor and participate in large number of welfare activities and social causes. Our business is more than banking because we touch the lives of people anywhere in many ways.</p>
            
        </div>      
    </td>
                
    
</tr></table>
    
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
            <center><img  src="images/business.jpg"  width="196" height="106"></center><br>
            
      
  Copyright © NIT Bank</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>

