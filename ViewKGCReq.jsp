<%@ include file="aHeader.jsp"%>
<%@ page import="java.sql.*,databaseconnection.*"%>
<body><div ><br><br>
<center><h3>User's Request</h3>
</center>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,id;
	int i=0,exp=0;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

id=request.getParameter("id");

//System.out.println(pwd);
%>
<%
Statement st1=con.createStatement();
ResultSet r=st1.executeQuery("SELECT  FROM register where no="+id+'");
if(r.next()){%>
	
<table border=2><tr><th>NO.</th><th>Name</th><th>Branch</th><th>Department</th><th>SubDepartment</th><th>Approved/NotApproved</th></tr>
<%
ResultSet r=st.executeQuery("select *from kgc");
while(r.next()){%>
<tr><td><strong><%=r.getInt(1)%></strong></td><td><strong><%=r.getString(2)%></td><td><strong><%=r.getString(8)%></td><td align="center"><strong><%=r.getString(9)%></td><td align="center"><strong><%=r.getString(10)%></td><td><a href="KGCAproved.jsp?id=<%=r.getInt(1)%>">Approved</a>/<a href="KGCNotAproved.jsp?id=<%=r.getInt(1)%>">NotApproved</a></td></tr>
<%}%>
<%}catch(Exception e){e.printStackTrace();}%>

</div ></table>
</body>
</html><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>
