<%@ include file="csHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>CP-ABE</title>
<body>
    <div ><br><br>
<center><h3>File Details</h3>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>  
<% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Registration is Approved by CA')</script>");
}
if(request.getParameter("keys")!=null){
	  out.println("<script>alert('Keys are generated Successfully')</script>");
}
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table border=2><tr><th>Fid</th><th>FileName</th><th>Owner</th><th>View</th></tr>
<%
ResultSet r=st.executeQuery("select *from filestore ");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(8)%></td>

<td><a href="views.jsp?fid=<%=r.getInt(1)%>"><font color="blue">Show</a><!-- <a href="KGCNotAproved.jsp?id=<%=r.getInt(1)%>">NotApproved</a> --></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>