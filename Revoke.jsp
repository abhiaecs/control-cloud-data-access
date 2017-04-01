<%@ include file="aaHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FA-ABE</title>
<body>
    <div ><br><br>
<center><h3>Revocation</h3>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Attribute Revoked Successfully')</script>");
}%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement(); Statement st1=con.createStatement();
%>
<table border=2><tr><th>User</th><th>Attribute</th><th>Revoke</th></tr>
<%
ResultSet r=st.executeQuery("select *from keygen1 where auth='"+unm+"' ");
while(r.next()){
	ResultSet r1=st1.executeQuery("select  unm from uregister where no='"+r.getString("uno")+"' ");
	if(r1.next()){
	%>
<tr><td><strong><%=r1.getString(1)%></strong></td><td><strong><%=r.getString(3)%></td>

<td><a href="revoke1.jsp?uno=<%=r.getString("uno")%>&atrbt=<%=r.getString(3)%>"><font size="" color="#3333ff">Revoke</font></a></td></tr>
<%}}
}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>