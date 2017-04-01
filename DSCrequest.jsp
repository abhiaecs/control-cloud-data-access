<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>



<%! String name,username,pasword,gen,doj,branch,dept,subdept,id,cno,adrs;
	int i=0,exp=0;
%>
<%
try{
Connection con = databasecon.getconnection();

Statement st=con.createStatement();

id=request.getParameter("id");
//System.out.println(pwd);
%>
<%
Statement st1=con.createStatement();
ResultSet r=st1.executeQuery("SELECT  *FROM register where no="+id+" ");
if(r.next()){
	name=r.getString(2);
	branch=r.getString(8);
	dept=r.getString(9);
	subdept=r.getString(10);
	}


int q= st.executeUpdate("insert into dsc(id,name,branch,dept,subdept) values("+id+",'"+name+"','"+branch+"','"+dept+"','"+subdept+"')");
if(q>0)
	{
	st.executeUpdate("update register set datastatus='Request Sent to Data Storing Center'  where no="+id+" ");
	response.sendRedirect("UserReq.jsp?dmsg=success");
	}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
