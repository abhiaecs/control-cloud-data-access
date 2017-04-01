<%@ include file="Header.jsp"%>
<div >
      <!-- <div class="common_content"> --><br><br><br>
	  <% if(request.getParameter("msg")!=null){
	  out.println("<script>alert('Incorrect Username or Password')</script>");
}%>
     <center>   <h2>Admin Login</h2><br>
<form action="adminCheck.jsp">
<table><tr>
	<td><h3>Username:</h3></td>
	<td><input type="text" name="unm"></td>
</tr>
<tr>
	<td><h3>Password:</h3></td>
	<td><input type="password" name="pwd"></td>
</tr>
<tr><td></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Login"></td></tr>
</table>



   </center>     <p><!-- Lorem ipsum dolor sit amet, consectetuer 
adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum 
sociis natoque penatibus et magnis dis parturient montes, nascetur 
ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
 quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla
 vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, 
imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis 
pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi.
 Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, 
consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, 
viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius
 laoreet. Quisque rutrum. Aenean imperdiet -->. </p>
        </div>
     <br><br><br>
<%@ include file="Footer.jsp"%>