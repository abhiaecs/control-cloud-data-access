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
<% 
	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 String filedata=request.getParameter("file");
	 String ss1=filedata.substring((filedata.length())/2);
	 String ss2=filedata.replace(ss1,"");

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
session.setAttribute("m1",ss2);
session.setAttribute("m2",ss1);
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
    <tr><td> <h3>Data Component( m1 ):</td><td><textarea name="m1" cols=30 rows=10><%=ss2%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 <tr><td> <h3>Data Component( m2 ):</td><td><textarea name="m2" cols=30 rows=10><%=ss1%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 <h3>ContentKey:</td><td><input type="text" name="pkey" readonly></td><td><a href="getPublicKey.jsp?unm=<%=unm%>&fid=<%=fid%>&fnm=<%=fnm%>"><font size="" color="#3366ff">Get ContentKey</font></tr>  <tr></tr><tr></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>
</body><%@ include file="Footer.jsp"%>