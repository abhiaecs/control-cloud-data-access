<%@ include file="aaHeader.jsp"%>
<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*,cp_abe.*" import="javax.swing.JOptionPane"%>

<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane,java.math.BigInteger,java.security.*,java.security.spec.*,javax.crypto.KeyAgreement"%>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,id,cno,adrs;
	int i=0,exp=0; String mk; boolean status=false,status1=true;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

id=request.getParameter("id");
String aaname=session.getAttribute("unm").toString();	
//System.out.println(pwd);
%>
<%
								List list=new ArrayList();
								list.clear();
Statement st1=con.createStatement();
ResultSet rs= st.executeQuery("select * from uregister where no="+id+" ");
if(rs.next())
	{
		String loc=rs.getString(8);
				int exp=rs.getInt(9);
						String spl=rs.getString(10);
								String mdegree=rs.getString(11);

								list.add(loc);
								list.add(exp);
								list.add(spl);
								list.add(mdegree);
	}
 Random random = new Random();
 String attr=list.get(random.nextInt(list.size())).toString();
Statement stt=con.createStatement();Statement stt1=con.createStatement();Statement stt2=con.createStatement();
ResultSet r2=stt2.executeQuery("select count(*) from keygen1 WHERE uno='"+id+"' ");
if(r2.next()){
if(!(r2.getInt(1)==4))
	{
while(status1){
ResultSet rstt=stt.executeQuery("select attr from keygen1  WHERE uno='"+id+"'  ");
while(rstt.next()){
if(rstt.getString(1).equals(attr)){
status=true;
}
}
if(status){
attr=list.get(random.nextInt(list.size())).toString();
}
ResultSet rstt1=stt1.executeQuery("select *from keygen1  WHERE uno='"+id+"' and attr='"+attr+"'  ");
if(rstt1.next()){
status1=true;
}else{
status1=false;
}
}
	} }
Statement st11=con.createStatement();
ResultSet rss=st11.executeQuery("select mk from aareg where  uname='"+aaname+"' ");
if(rss.next()){
mk=rss.getString(1);
}
Statement st12=con.createStatement();
cpabe cp=new cpabe();
cp.generateKeys();
String pkey =cp.getPublicKey();
pkey=pkey.substring(0,5);
String skey=cp.getPrivateKey();
skey=skey.substring(0,5);
	//response.sendRedirect("register.jsp");
Statement stmt=con.createStatement();
ResultSet rst=stmt.executeQuery(" SELECT COUNT(*)>=2 FROM keygen1 WHERE uno='"+id+"' AND auth='"+aaname+"' ");
if(rst.next()){
	if(!(rst.getInt(1)==1)){
		status=false;
		status1=true;
 int rss1=st12.executeUpdate("insert into keygen1 values('"+aaname+"','"+id+"','"+attr+"','"+pkey+"','"+skey+"','"+mk+"')");
 if(rss1!=0)
	{

	response.sendRedirect("Userslist1.jsp?keys=succ");
} 
}
	else{
	response.sendRedirect("Userslist1.jsp?keys1=fail");

}
}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="Footer.jsp"%>