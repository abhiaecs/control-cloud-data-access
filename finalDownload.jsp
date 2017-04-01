<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*,java.io.*"%>

<%
    String fid=request.getParameter("fid");

	// String eid=(String)session.getAttribute("eid");
	  //String fname=(String)session.getAttribute("fnm");
	
	 
	     try{
		 
		 Connection con=databasecon.getconnection();
		
	
			String filename =request.getParameter("fname");
System.out.println("slength="+filename);
String s[]=filename.split("\\.");
System.out.println("slength1="+s.length);

		
			byte[] ba = request.getParameter("file").getBytes();
		
			/*if(s[1].equalsIgnoreCase("GIF")|| s[1].equalsIgnoreCase("gif"))
			 {
			response.setContentType("image/gif");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".gif\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}
			if(s[1].equalsIgnoreCase("jpg")|| s[1].equalsIgnoreCase("jpg"))
			 {
			response.setContentType("image/jpg");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".jpg\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}

if(s[1].equalsIgnoreCase("png")|| s[1].equalsIgnoreCase("png"))
			 {
			response.setContentType("image/png");//application/notepadimage/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".png\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}*/
			if(true)
			 {
			response.setContentType("application/notepad");//image/jpeg,,	image/png
			response.setHeader("Content-Disposition","attachment; filename=\""+s[0]+".txt  \"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
		
			//session.removeAttribute("file");
			}

	
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}
		
		
		
%>