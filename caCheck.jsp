<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");

if(unm.equals("CA") && pwd.equals("CA")){
	response.sendRedirect("CAHome.jsp");
}else{
	response.sendRedirect("ca.jsp?msg=fail");
}%>