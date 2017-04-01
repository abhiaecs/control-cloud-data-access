<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<%!int count=0;%>
<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();Statement st2=con.createStatement();

   ResultSet r2=st2.executeQuery("select count(*) from keygen1 where uno=(select no from uregister where unm='"+unm+"')");
   if(r2.next()){

	   count=r2.getInt(1);
   }

		if(count>=4){
ResultSet r=st.executeQuery("select * from uregister where unm='"+unm+"' and pwd='"+pwd+"' and guid!='None' ");
if(r.next())
	{
	String sts=r.getString(1);
	session.setAttribute("unm",unm);
	response.sendRedirect("UHome.jsp");
	
 }
 else
 response.sendRedirect("User.jsp?msg1=fail");

   }
   else{
	  response.sendRedirect("User.jsp?atrbt=fail");

   }
}catch(Exception e){e.printStackTrace();}

%>