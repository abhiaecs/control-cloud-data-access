<%@ include file="kHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FA-ABE</title>
<body>
    <div ><br><br>
<center><h3>User's Request</h3>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Request is Approved by KGC')</script>");
}%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table border=2><tr><th>NO.</th><th>Name</th><th>Branch</th><th>Department</th><th>SubDepartment</th><th>Approved / NotApproved</th></tr>
<%
ResultSet r=st.executeQuery("select *from kgc");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(3)%></td><td align="center"><strong><%=r.getString(4)%></td>
<td align="center"><strong><%=r.getString(5)%></td>

<td><a href="KGCAproved.jsp?id=<%=r.getInt(1)%>">Approved</a> &nbsp;/&nbsp;<a href="KGCNotAproved.jsp?id=<%=r.getInt(1)%>">NotApproved</a></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>