<%@ include file="aaHeader.jsp"%>
<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane,java.math.BigInteger,java.security.*,java.security.spec.*,javax.crypto.KeyAgreement"
%>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,id,cno,adrs,col;
	int i=0,exp=0;
%>
<%
Random r=new Random();
int skey=r.nextInt(100000);
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
String uno=request.getParameter("uno");
String atrbt=request.getParameter("atrbt");
if(atrbt.equals("India")||atrbt.equals("US")|| atrbt.equals("Europe"))
	{
	col="loc";
	}else{
if(atrbt.equals("Dermatology")||atrbt.equals("Cardiology")|| atrbt.equals("ENT")|| atrbt.equals("Orthopedic")|| atrbt.equals("Psychiatry")){
col="splty";
}else{
if(atrbt.equals("MD")||atrbt.equals("DM")|| atrbt.equals("DO")){
col="mdegree";
	}
	else{
col="exp";
           }
}
	}
	String atrbtrvk=atrbt+"RVK";
	if(col.equals("exp")){
atrbtrvk="100";
	}
//System.out.println(pwd);
Statement st1=con.createStatement();
int  i= st.executeUpdate("update uregister set "+col+"='"+atrbtrvk+"' where no='"+uno+"'  ");
if(i>0)
	{
	 st1.executeUpdate("insert into ct values('"+uno+"','"+atrbt+"','"+unm+"')");
	 response.sendRedirect("Revoke.jsp?msg=Revoke");
}
else{
response.sendRedirect("Revoke.jsp?msg=Revoke");
}
}catch(Exception e){e.printStackTrace();}
	%>
