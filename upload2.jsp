  <%@ include file="uHeader.jsp"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>FA-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
%>
<% try{
	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 String filedata=request.getParameter("file");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
ResultSet r=st.executeQuery("select  *from register where unm='"+unm+"' ");
if(r.next())
	{
pkey=r.getString(1);
	}
%>
<body>
  <div class="container">
    <section class="register">
      <center><h1><font size="" color="ff6600">FileUploading</font></h1><br><br>
      <form>
 <table>
    <tr>
	<td><h3>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 <h3>FileName:</td><td><input type="text" name="fname" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> <h3>FileData:</td><td><textarea name="file" cols=30 rows=10><%=filedata%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 <h3>PublicKey:</td><td><input type="text" name="pkey" readonly></td><td><a href="getPublicKey.jsp?unm=<%=unm%>">Get PublicKey</tr>  <tr></tr><tr></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>
</body><%@ include file="Footer.jsp"%>