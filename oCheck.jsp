<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>
<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");
System.out.println(unm);
System.out.println(pwd);
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

ResultSet r=st.executeQuery("select *from uregister where unm='"+unm+"' and pwd='"+pwd+"' ");
if(r.next())
	{
	String sts=r.getString(1);
	
	session.setAttribute("unm",unm);
	response.sendRedirect("OHome.jsp");
	
}
 else
	{
 response.sendRedirect("owner.jsp?msg1=fail");
	}
}catch(Exception e){e.printStackTrace();}

%>