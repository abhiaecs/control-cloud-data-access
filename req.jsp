<%@ include file="csHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>FA-ABE</title>
<body>
    <div ><br><br>
<center><h3>Attribute Authority ReqDetails</h3>

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
if(request.getParameter("m")!=null){
	  out.println("<script>alert('CipherText Updated Successfully...!')</script>");
}
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();
%>
<table border=2><tr><th>User No</th><th>Attribute</th><th>Authority</th><th>Update</th></tr>
<%
ResultSet r=st.executeQuery("select *from ct ");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(3)%></td>

<td><a href="update.jsp?fid=<%=r.getInt(1)%>&atrbt=<%=r.getString(2)%>"><font size="" color="#3333ff">CipherText</font></a><!-- <a href="KGCNotAproved.jsp?id=<%=r.getInt(1)%>">NotApproved</a> --></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>
</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>