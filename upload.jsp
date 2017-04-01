<%@ include file="oHeader.jsp"%>
<div >
      <!-- <div class="common_content"> --><br>
	  
<% if(request.getParameter("upload")!=null){
	  out.println("<script>alert('File Upload Successfully')</script>");
}%>
  <center><h1><font size="" color="ff6600">FileUploading</font></h1><br><br><br>
<form action="upload1.jsp" enctype="multipart/form-data" method="post">
<table><tr>
	<td><h3>Attach File: &nbsp;&nbsp;&nbsp;<input type="file"  name="filename"   required></td>
</tr>
<tr></tr><tr></tr>
<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Next"></td></tr>
</table>
</form>



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
     <br><br><br><br><br>
<%@ include file="Footer.jsp"%>