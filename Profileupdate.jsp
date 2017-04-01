<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,eid,cno,adrs;
	int i=0,exp=0;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

name=request.getParameter("nm");
username=request.getParameter("unm");
pasword=request.getParameter("pwd");
gen=request.getParameter("gen");
 doj=request.getParameter("doj");
exp=Integer.parseInt(request.getParameter("exp"));
branch=request.getParameter("branch");
dept=request.getParameter("dept");
subdept=request.getParameter("subdept");
eid=request.getParameter("eid");
cno=request.getParameter("cno");
adrs=request.getParameter("adrs");

//System.out.println(pwd);
%>
<%
int q= st.executeUpdate("update register set name= '"+name+"',pwd='"+pasword+"',gen='"+gen+"',doj='"+doj+"', exp="+exp+",branch='"+branch+"',dept='"+dept+"',subdept='"+subdept+"',eid='"+eid+"',cno='"+cno+"',adrs='"+adrs+"'  where unm='"+username+"' ");

if(q>0)
{
/*Random rn=new Random();
int mkey=rn.nextInt(100000);
	//response.sendRedirect("register.jsp");
 st.executeUpdate("insert into register1 values("+i+",AES_ENCRYPT('"+name+"',"+mkey+"),AES_ENCRYPT('"+username+"',"+mkey+"),AES_ENCRYPT('"+pasword+"',"+mkey+"),AES_ENCRYPT('"+company+"',"+mkey+"),AES_ENCRYPT('"+email+"',"+mkey+"), AES_ENCRYPT('"+mobileno+"',"+mkey+"),AES_ENCRYPT('"+department+"',"+mkey+"),AES_ENCRYPT('"+salary+"',"+mkey+"),"+mkey+")");*/
	response.sendRedirect("User.jsp?update=succ");
}
else{
	response.sendRedirect("User.jsp.jsp?reg=fail");

}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
