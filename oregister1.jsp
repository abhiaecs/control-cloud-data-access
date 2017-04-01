<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,loc,degree,spl,eid,cno,adrs,etype;
	int i=0,exp=0;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

name=request.getParameter("nm");
username=request.getParameter("unm");
pasword=request.getParameter("pwd");
//gen=request.getParameter("gen");
eid=request.getParameter("eid");
cno=request.getParameter("cno");




//System.out.println(pwd);
%>
<%
Statement st1=con.createStatement(); Statement st2=con.createStatement();

ResultSet r2=st2.executeQuery("SELECT *FROM oreg where oname='"+username+"' ");
if(!r2.next()){

ResultSet r=st1.executeQuery("SELECT MAX(no) FROM oreg");
if(r.next()){
	i=r.getInt(1);
	if(i>=0){ i++;}}


int q= st.executeUpdate("insert into oreg values("+i+",'"+name+"','"+username+"','"+pasword+"','"+eid+"', '"+cno+"')");

if(q>0)
{
/*Random rn=new Random();
int mkey=rn.nextInt(100000);
	//response.sendRedirect("register.jsp");
 st.executeUpdate("insert into register1 values("+i+",AES_ENCRYPT('"+name+"',"+mkey+"),AES_ENCRYPT('"+username+"',"+mkey+"),AES_ENCRYPT('"+pasword+"',"+mkey+"),AES_ENCRYPT('"+company+"',"+mkey+"),AES_ENCRYPT('"+email+"',"+mkey+"), AES_ENCRYPT('"+mobileno+"',"+mkey+"),AES_ENCRYPT('"+department+"',"+mkey+"),AES_ENCRYPT('"+salary+"',"+mkey+"),"+mkey+")");*/
	response.sendRedirect("owner.jsp?reg=succ");
}
else{
	response.sendRedirect("owner.jsp?reg=fail");

}
}else{

	response.sendRedirect("oregister.jsp?unm=fail");
}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
