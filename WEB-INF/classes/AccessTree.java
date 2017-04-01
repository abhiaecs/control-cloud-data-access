package cp_abe;
import  databaseconnection.databasecon;
import java.sql.*;
public class AccessTree 
{ String sky[]=null,sky1[]=null;
boolean status;
//Connection con=null;
    //Statement st=con.createStatement();

	public  boolean m_a_p(String access,String skey){
		//	con=databasecon.getconnection();
 sky=skey.split(":");
 sky1=sky[1].split(",");
String plcy[]=access.split("and");
if ( plcy[0].trim().equalsIgnoreCase( sky1[1]) && plcy[1].trim().equalsIgnoreCase( sky1[2]) && plcy[2].trim().equalsIgnoreCase( sky1[3])  )
{
	status=true;
}else{
	status=false;
	}
	return status;
}


public boolean bmRpnNeng(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");
 String aces=access.replace('(',' ');
 String aces1=aces.replace(')',' ');
String plcy1[]=aces1.split("and");
String plcy2[]=plcy1[0].split("or");
if (  (plcy2[0].trim().equalsIgnoreCase( sky1[1]) || plcy2[1].trim().equalsIgnoreCase( sky1[1]) ) && (plcy1[1].trim().equalsIgnoreCase( sky1[2]))  )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}

public boolean pnNengNexp(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");
String plcy1[]=access.split("and");
String plcy2[]=plcy1[2].split("<");
if (  plcy1[0].trim().equalsIgnoreCase( sky1[1])  &&  plcy1[1].trim().equalsIgnoreCase( sky1[2])  && ( Integer.parseInt(sky1[4])<Integer.parseInt(plcy2[1].trim()) )  )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}


public boolean bmRpnNbengRacntNexp(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");
 String aces2=access.replace('(',' ');
 String aces3=aces2.replace(')',' ');

String plcy1[]=aces3.split("and");
String plcy2[]=plcy1[0].split("or");
String plcy3[]=plcy1[1].split("or");
String plcy4[]=plcy1[2].split(">");
if (  (plcy2[0].trim().equalsIgnoreCase( sky1[1])  ||  plcy2[1].trim().equalsIgnoreCase( sky1[1]) ) && (plcy3[0].trim().equalsIgnoreCase( sky1[2])  ||  plcy3[1].trim().equalsIgnoreCase( sky1[2]) ) &&( Integer.parseInt(sky1[4])>Integer.parseInt(plcy4[1].trim()) )  )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}

public boolean mNbengNprgRbacntNpay(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");

 String aces2=access.replace('(',' ');
 String aces3=aces2.replace(')',' ');

 String plcy1[]=aces3.split("or");

String plcy2[]=plcy1[0].split("and");


String plcy3[]=plcy1[1].split("and");
//String plcy4[]=aces33.split("and");
if (  plcy2[0].trim().equalsIgnoreCase( sky1[1]) && (   ( plcy2[1].trim().equalsIgnoreCase( sky1[2])  && plcy2[2].trim().equalsIgnoreCase( sky1[3]) ) ||  ( plcy3[0].trim().equalsIgnoreCase( sky1[2])  && plcy3[1].trim().equalsIgnoreCase( sky1[3]) ) ) )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}

public boolean bmNacntNpayRbpnNacntNpay(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");

 String aces2=access.replace('(',' ');
 String aces3=aces2.replace(')',' ');

 String plcy1[]=aces3.split("or");

String plcy2[]=plcy1[0].split("and");


String plcy3[]=plcy1[1].split("and");
//String plcy4[]=aces33.split("and");
if ( ( plcy2[0].trim().equalsIgnoreCase( sky1[1]) &&  plcy2[1].trim().equalsIgnoreCase( sky1[2])  && plcy2[2].trim().equalsIgnoreCase( sky1[3]) ) ||  ( plcy3[0].trim().equalsIgnoreCase( sky1[1]) &&  plcy3[1].trim().equalsIgnoreCase( sky1[2])  && plcy3[2].trim().equalsIgnoreCase( sky1[3]) ) )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}

public boolean bmRdNbengNbdesngRprg(String access,String skey){
sky=skey.split(":");
 sky1=sky[1].split(",");

 String aces2=access.replace('(',' ');
 String aces3=aces2.replace(')',' ');

 String plcy1[]=aces3.split("and");

String plcy2[]=plcy1[0].split("or");


String plcy3[]=plcy1[2].split("or");
//String plcy4[]=aces33.split("and");
if ( ( plcy2[0].trim().equalsIgnoreCase( sky1[1]) ||  plcy2[1].trim().equalsIgnoreCase( sky1[1]) )  &&  ( plcy1[1].trim().equalsIgnoreCase( sky1[2])  &&  ( plcy3[0].trim().equalsIgnoreCase( sky1[3]) || plcy3[1].trim().equalsIgnoreCase( sky1[3]) )) )
{
	status=true;
}else{
	status=false;
	} 
	return status;
	}









}


