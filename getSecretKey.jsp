  <%@ include file="uHeader.jsp"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,skey=null;
int i=0;byte data[]=null;
String skkey,no;String oname=null;
%>
 <%
		
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();Statement st2=con.createStatement();
unm=(String)session.getAttribute("unm");
fid=request.getParameter("fid");
ResultSet r12=st.executeQuery("select owner from filestore  where  fid="+fid+" ");
if(r12.next()){
	oname=r12.getString(1);
}

ResultSet r1=st1.executeQuery("select no from uregister where unm='"+oname+"'  ");
if(r1.next()){
	no=r1.getString(1);
}
 skkey="";
ResultSet r2=st2.executeQuery("select skey from keygen1 where uno="+no+" ");
while(r2.next()){
	skkey=skkey+r2.getString(1);
}



ResultSet r=st.executeQuery("select fname,filedata from filestore where fid="+fid+"  ");
if(r.next())
	{
	System.out.println("if");
	fnm=r.getString(1);
	data=r.getBytes(2);
}
}catch(Exception e11)
{
e11.printStackTrace();
}

%>
<body>
  <div class="container">
    <section class="register">
      <center><h1><font size="" color="ff6600">FileDownload</font></h1>
      <form method="post" action="decrypt.jsp">
 <table>
    <tr>
	<td><h3>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 <h3>FileName:</td><td><input type="text" name="fname" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> <h3>FileData:</td><td><textarea name="file" cols=30 rows=10><%=new String(data)%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 <h3>Private Key:</td><td><textarea name="skey" cols=30 rows=4><%=skkey%></textarea></td></tr>  <tr></tr><tr></tr>
	 <tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Decrypt"></td></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>
</body><%@ include file="Footer.jsp"%>