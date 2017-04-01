<% String unm=request.getParameter("unm");
String pwd=request.getParameter("pwd");

if(unm.equals("KGC") && pwd.equals("KGC")){
	response.sendRedirect("KGCHome.jsp");
}else{
	response.sendRedirect("KgcLogin.jsp?msg=fail");
}%>