<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");

if(unm.equals("CS") && pwd.equals("CS")){
	response.sendRedirect("CSHome.jsp");
}else{
	response.sendRedirect("csLogin.jsp?msg=fail");
}%>