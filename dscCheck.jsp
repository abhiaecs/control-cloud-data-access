<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");

if(unm.equals("DSC") && pwd.equals("DSC")){
	response.sendRedirect("DSCHome.jsp");
}else{
	response.sendRedirect("DscLogin.jsp?msg=fail");
}%>