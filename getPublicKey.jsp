  <%@ include file="oHeader.jsp"%>
  <%@page import="java.util.*"%>
  <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>CP-ABE</title>
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
<%!String  thisLine = null;
StringBuffer sb1=null,filedata;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;


%>
<% 
Random rr=new Random();
int rno=rr.nextInt(100000);


	 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fnm");
	 filedata=(StringBuffer)session.getAttribute("data");
Connection con=databasecon.getconnection();
int no=0;
Statement st=con.createStatement();Statement st1=con.createStatement();
ResultSet rr1=st1.executeQuery("select no from uregister where unm='"+unm+"'");
if(rr1.next()){
no=rr1.getInt(1);
}
ResultSet r=st.executeQuery("select  pkey from keygen1 where uno='"+no+"' ");
String pkey="";
while(r.next())
	{
pkey=pkey+r.getString(1);
	}
%>
<body>
  <div class="container">
    <section class="register">
      <center><h1><font size="" color="ff6600">FileUploading</font></h1>
      <form method="post" action="encrypt.jsp">
 <table>
    <tr>
	<td><h3>File ID:</td> <td><input type="text" name="fid" value=<%=fid%> placeholder="" required></td>
</tr>   <tr></tr><tr></tr>
<tr><td>
	 <h3>FileName:</td><td><input type="text" name="fnm" value=<%=fnm%> placeholder="" required></td></tr>  <tr></tr><tr></tr>
    <tr><td> <h3>FileData:</td><td><textarea name="file" cols=30 rows=10><%=filedata%></textarea></td></tr><tr></tr><tr></tr>
     <tr><td>
	 <h3>Public Key:</td><td><input type="text" name="pkey" readonly value=<%=pkey%>></td></tr>  <tr></tr><tr></tr>
	 <tr><td><h3>Select Attribute:</td><td><select id="mySelect" onchange="myFunction()">
	 <option value="" selected>Select Location
	 <option value="India,c='India'">India</option>
	 <option value="US,c='US'">US</option>
	 <option value="Europe,c='Europe'">Europe</option>
	 <!-- <option value="Banglore,c='Banglore'">Banglore</option> -->
	 </td></tr>
	 <tr><td></td><td><select id="mySelect2" onchange="myFunction2()">
	 	 <option value="" selected>Select Specialist
	 <option value="Dermatology,d='Dermatology'">Dermatology</option>
	 <option value="Cardiology,d='Cardiology'">Cardiology</option>
	 <option value="ENT,d='ENT'">ENT</option>
	 <option value="Orthopedic,d='Orthopedic'">Orthopedic</option>
	 	 <option value="Psychiatry,d='Psychiatry'">Psychiatry</option>
	 </td></tr>
	 <tr><td></td><td><select id="mySelect3" onchange="myFunction3()"> 	 
	 <option value="" selected>Select Medical Degree
 <option value="MD,sd='MD'">MD</option>
	 <option value="DM,sd='DM'">DM</option>
	 <option value="DO,sd='DO'">DO</option>
	 <!-- <option value="Investment,sd='Investment'">Investment</option> -->
</td></tr>
<tr><td></td><td><select id="mySelect4" onchange="myFunction4()">
	 	 <option value="" selected>Select Experience
<option value="1">1</option>
	 <option value="2">2</option>
	 <option value="3">3</option>
	 <option value="4">4</option>
	 <option value="5">5</option>
	 <option value="6">6</option>
	 <option value="7">7</option>
	 <option value="8">8</option>
	 	 <option value="9">9</option>
		 	 <option value="10">10</option>
	 </td><td><select id="mySelect5" onchange="myFunction5()">
	  	 <option value="" selected>Select  Operator
	 <option value="&&">AND</option>
	 <option value="||">OR</option>
	 <option value="(">(</option>
	 <option value=")">)</option>
	 <option value="exp<">&lt;</option>
	 <option value="exp>">&gt;</option>
	  <option value="exp<=">&lt=</option>
	  <option value="exp>=">&gt=</option>
	 </td>
	 </tr>  <tr></tr><tr></tr>
	 <tr><td><h3>Access Structure<td><textarea  rows="3" cols="50" id="ids" readonly  name="ids"  class="special"  required></textarea><textarea  rows="3" cols="50" id="idss" hidden name="idss"  class="special"  required></textarea>
	 <tr><td>
	 </td><td><input type="submit" value="Encrypt">  </td></tr>  <tr></tr><tr></tr>
	 
	   <table>
      </form>
    </section>
  </div><br><br><br><br><br>
</body><%@ include file="Footer.jsp"%>