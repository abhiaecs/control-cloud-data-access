<%@ include file="aHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FA-ABE</title>
<body>
    <div ><br><br>
<center><h3>User's Request</h3>
</center>
<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<% if(request.getParameter("kmsg")!=null){
	  out.println("<script>alert('Request Sent to KGC')</script>");
}%>
<% if(request.getParameter("dmsg")!=null){
	  out.println("<script>alert('Request Sent to DSC')</script>");
}%>

<% if(request.getParameter("req")!=null){
	  out.println("<script>alert('Approved by  Admin')</script>");
}%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table border=2><tr><th>NO.</th><th>Name</th><th>Branch</th><th>Department</th><th>SubDepartment</th><th>Send Request to KGC</th><th>KGC Request Status</th><th>Send Request to data storing center</th><th>Data Storing Center Request Status</th><th>Admin Request Status</th></tr>
<%
ResultSet r=st.executeQuery("select *from register");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(8)%></td><td align="center"><strong><%=r.getString(9)%></td>

<td align="center"><strong><%=r.getString(10)%></td>
<%if(r.getString(14).equals(" Request Sent to KGC")){%>
<td align="center"><font color="green"><%=r.getString(14)%></font></td>
<%}else{%>
<td align="center"><a href="KGCrequest.jsp?id=<%=r.getInt(1)%>"><%=r.getString(14)%></a></td><%}%>
<td align="center"><%=r.getString(17)%></td>
<% if(r.getString(15).equals("Request Sent to Data Storing Center")){%>
<td align="center"><font color="green"><%=r.getString(15)%></font></td>

<%}else{%>
<td><a href="DSCrequest.jsp?id=<%=r.getInt(1)%>"><%=r.getString(15)%></a></td>
<%}%>
<td align="center"><%=r.getString(18)%></td>
<% if(r.getString(16).equals("Approved/NotApproved")){%>
<td><a href="AdminAproved.jsp?id=<%=r.getInt(1)%>">Approved</a>&nbsp;/&nbsp;<a href="AdminNotAproved.jsp?id=<%=r.getInt(1)%>">NotApproved</a></td>
<%}else{%>
<td align="center"><%=r.getString(16)%></td><%}%></tr>
<%}}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>