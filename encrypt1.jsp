  <%@ include file="oHeader.jsp"%>
 <%@ page import ="java.io.*,java.security.KeyFactory,java.security.KeyPair,java.security.KeyPairGenerator, java.security.PrivateKey, java.security.PublicKey, java.security.Security, java.security.spec.EncodedKeySpec, java.security.spec.PKCS8EncodedKeySpec, java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.Statement"%>
<%@ page import ="javax.crypto.Cipher,javax.crypto.CipherInputStream,java.util.*, javax.crypto.CipherOutputStream,de.flexiprovider.core.FlexiCoreProvider,java.util.*"%>
<% %>

  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>FA-ABE</title>
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script>
function myFunction() {
    var x = document.getElementById("mySelect").value;
	var sp=x.split(",");
		var s=document.getElementById("ids").value;
		var s1=document.getElementById("idss").value;
	//var s1=document.getElementById("idss").value;
document.getElementById("ids").innerHTML = s+sp[0];
document.getElementById("idss").innerHTML = s1+sp[1];
	 
//	document.getElementById("demo").innerHTML = "You selected: " + x;
}
</script>
<script>
function myFunction2() {
    var x2 = document.getElementById("mySelect2").value;
	var sp1=x2.split(",");
	  var xx=document.getElementById("ids").value;
	   var xx1=document.getElementById("idss").value;
	document.getElementById("ids").innerHTML =xx+sp1[0];
document.getElementById("idss").innerHTML =xx1+sp1[1];
	//document.getElementById("demo").innerHTML = "You selected: " + x2;
}
</script>
<script>
function myFunction3() {
    var x3 = document.getElementById("mySelect3").value;
		var sp2=x3.split(",");
	 var xxx=document.getElementById("ids").value;
	  var xxx1=document.getElementById("idss").value;
    //document.getElementById("ids").innerHTML =xxx+x3;
	document.getElementById("ids").innerHTML =xxx+sp2[0];
document.getElementById("idss").innerHTML =xxx1+sp2[1];
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>

<script>
function myFunction4() {
    var x4 = document.getElementById("mySelect4").value;
	 var xxxx=document.getElementById("ids").value;
	 	 var xxxx1=document.getElementById("idss").value;
    //document.getElementById("ids").innerHTML =xxxx+x4;
		document.getElementById("ids").innerHTML =xxxx+x4;
document.getElementById("idss").innerHTML =xxxx1+x4;
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>
<script>
function myFunction5() {
    var x5 = document.getElementById("mySelect5").value;
	 var xxxxx=document.getElementById("ids").value;
	  var xxxxx1=document.getElementById("idss").value;
   // document.getElementById("ids").innerHTML =xxxxx+x5;
	document.getElementById("ids").innerHTML =xxxxx+x5;
document.getElementById("idss").innerHTML =xxxxx1+x5;
   // document.getElementById("ids").innerHTML =xxxxx+x5;
	//document.getElementById("demo").innerHTML = "You selected: " + x3;
}
</script>



</head>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>
<%
Random rr=new Random();
 rno=rr.nextInt(100000);

 String fid1=request.getParameter("fid");
 	 String fnm1=request.getParameter("fnm");
 String ckey=request.getParameter("pkey");
 //filedata=(StringBuffer)session.getAttribute("data");
	 String m1=request.getParameter("m1");
	 String m2=request.getParameter("m2");
 Connection con1=databasecon.getconnection();
 System.out.println("acess="+request.getParameter("idss"));
 PreparedStatement p=con1.prepareStatement("update  filestore set m2=AES_ENCRYPT('"+m2+"','"+ckey+"'),access2=?,ckey2='"+ckey+"',ct2=AES_ENCRYPT('"+ckey+"',?) where fid='"+fid1+"' ");
p.setString(1,request.getParameter("idss"));
p.setString(2,request.getParameter("idss"));
 //System.out.println("sbhelooooooooooo11");
p.executeUpdate();
 %>
<%!
byte data[]=null,data1[]=null;
%>
<% 
	/* unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fnm");
	 String pubkey=request.getParameter("pkey");
	 filedata=(StringBuffer)session.getAttribute("data");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();

/*PreparedStatement p1=con.prepareStatement("update filestore set akey=? where fid="+fid+" ");
p1.setString(1,new String(sb1));
p1.executeUpdate();*/
Connection con=databasecon.getconnection();
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet r1=st.executeQuery("select m1,m2 from filestore where fid="+fid1+" ");
if(r1.next())
	{
data=r1.getBytes(1);
data1=r1.getBytes(2);
	}
%>
<body>
  <div class="container">
    <section class="register">
      <center><h1><font size="" color="ff6600">FileUploading</font></h1><br><br>
      <form method="post" action="finalupload.jsp">
 <table>
    <tr>
	<td><h3>File ID:</td> <td><input type="text" name="fid" value=<%=fid1%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 <h3>FileName:</td><td><input type="text" name="fname" value=<%=fnm1%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> <h3>Data (m1 ):</td><td><textarea name="file" cols=30 rows=10><%=new String(data)%></textarea></td></tr><tr></tr><tr></tr>
	<tr><td> <h3> Data (m2) :</td><td><textarea name="m2" cols=30 rows=10><%=new String(data1)%></textarea></td></tr><tr></tr><tr></tr>
	 <tr><td>
	 </td><td><input type="submit" value="Upload">  </td></tr>  <tr></tr><tr></tr>
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>
