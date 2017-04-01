  <%@ include file="uHeader.jsp"%>
 <%@ page import ="java.io.*,java.security.KeyFactory,java.security.KeyPair,java.security.KeyPairGenerator, java.security.PrivateKey, java.security.PublicKey, java.security.Security, java.security.spec.EncodedKeySpec, java.security.spec.PKCS8EncodedKeySpec, java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement"%>
<%@ page import ="javax.crypto.Cipher,javax.crypto.CipherInputStream,java.util.*, javax.crypto.CipherOutputStream,de.flexiprovider.core.FlexiCoreProvider"%>
<% Security.addProvider(new FlexiCoreProvider());
KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA", "FlexiCore");
	Cipher cipher = Cipher.getInstance("RSA", "FlexiCore");
kpg.initialize(1024);
	KeyPair keyPair = kpg.generateKeyPair();
	PrivateKey privKey = keyPair.getPrivate();
	PublicKey pubKey = keyPair.getPublic();%>

  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>
<%

	 unm=(String)session.getAttribute("unm");
Random r=new Random();
rno=r.nextInt(10000);

 s= String.valueOf(rno);String fid1=request.getParameter("fid");
 	 String fnm1=request.getParameter("fnm");
 String pkey=request.getParameter("pkey");
 filedata=(StringBuffer)session.getAttribute("data");
 Connection con1=databasecon.getconnection();
 PreparedStatement p=con1.prepareStatement("insert into filestore(fid,fname,filedata,access,pkey,refkey,akey,owner) values(?,?,AES_ENCRYPT(?,'"+pkey+"'),?,?,?,?,'"+unm+"')");
p.setInt(1,Integer.parseInt(fid1));
p.setString(2,fnm1);
p.setBytes(3,new String(filedata).getBytes());
p.setString(4,request.getParameter("idss"));
p.setString(5,pkey);
p.setBytes(6,privKey.getEncoded());
p.setString(7,s);
p.executeUpdate();
 %>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% 
	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fnm");
	 String pubkey=request.getParameter("pkey");
	 filedata=(StringBuffer)session.getAttribute("data");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();

ResultSet r1=st.executeQuery("select filedata from filestore where fid="+fid+" ");
if(r1.next())
	{
data=r1.getBytes(1);
	}
%>
<body>
  <div class="container">
    <section class="register">
      <center><h1><font size="" color="ff6600">FileUploading</font></h1>
      <form method="post" action="finalupload.jsp">
 <table>
    <tr>
	<td><h3>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 <h3>FileName:</td><td><input type="text" name="fname" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> <h3>FileData:</td><td><textarea name="file" cols=30 rows=10><%=new String(data)%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 </td><td><input type="submit" value="Upload">  </td></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>

</body><%@ include file="Footer.jsp"%>