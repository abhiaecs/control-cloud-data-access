<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");

if(unm.equals("admin") && pwd.equals("admin")){
	response.sendRedirect("adminHome.jsp");
}else{
	response.sendRedirect("Admin.jsp?msg=fail");
}%>