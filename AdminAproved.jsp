<%@ page import="java.sql.*"%>


<%@ page  import="java.sql.*" import="databaseconnection.*,java.util.*" import="javax.swing.JOptionPane"%>

<%@ page import="databaseconnection.*,java.util.*,jpbc.ECCKeyAgreement,javax.swing.JOptionPane,java.math.BigInteger,java.security.*,java.security.spec.*,javax.crypto.KeyAgreement"%>

<%! String name,username,pasword,gen,doj,branch,dept,subdept,id,cno,adrs,skey;
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
Statement st2=con.createStatement();
Statement st3=con.createStatement();
 
ResultSet q= st.executeQuery("select unm,branch,dept,subdept,exp from register where no="+id+" ");
if(q.next())
	{
username=q.getString(1);
branch=q.getString(2);
dept=q.getString(3);
subdept=q.getString(4);
exp=q.getInt(5);
	}
KeyPairGenerator kpg;
 kpg = KeyPairGenerator.getInstance("EC","SunEC");
 ECGenParameterSpec ecsp;
 ecsp = new ECGenParameterSpec("secp192k1");
 kpg.initialize(ecsp);
 KeyPair kpU = kpg.genKeyPair();
	PrivateKey privKeyU = kpU.getPrivate();
	System.out.println("skeyaaaaaaaaaaa='"+privKeyU.toString());

 PublicKey pubKeyU = kpU.getPublic();
 KeyPair kpV = kpg.genKeyPair();
 PrivateKey privKeyV = kpV.getPrivate();
 PublicKey pubKeyV = kpV.getPublic();
 KeyAgreement ecdhU = KeyAgreement.getInstance("ECDH");
 ecdhU.init(privKeyU);
 ecdhU.doPhase(pubKeyV,true);
 KeyAgreement ecdhV = KeyAgreement.getInstance("ECDH");
 ecdhV.init(privKeyV);
 ecdhV.doPhase(pubKeyU,true);
 System.out.println("Secret computed by U: 0x" + (new BigInteger(1, ecdhU.generateSecret())
 .toString(16)).toUpperCase());
 System.out.println("Secret computed by V: 0x" + (new BigInteger(1, ecdhV.generateSecret())
 .toString(16)).toUpperCase());
skey=(new BigInteger(1, ecdhU.generateSecret()).toString(16)).toUpperCase()+":"+username+","+branch+","+dept+","+subdept+","+exp;
	System.out.println("skey='"+skey);

KeyPairGenerator kpg1;
 kpg1 = KeyPairGenerator.getInstance("EC","SunEC");
 ECGenParameterSpec ecsp1;
 ecsp1 = new ECGenParameterSpec("secp192k1");
 kpg.initialize(ecsp1);
 KeyPair k = kpg1.genKeyPair();
 PublicKey pubKeys = k.getPublic();
 PrivateKey privKeys = k.getPrivate();
	//ecc.generateSecretKey()+":"+username+","+branch+","+dept+","+subdept+","+exp;
System.out.println("pubKeyU="+pubKeyU.toString());
System.out.println("pubKeyU="+privKeyU.toString()+"="+"pubKeyU1="+privKeyU);


 PreparedStatement pstmt=con.prepareStatement("update kgc set pkey=?,mkey=? where id="+id+" ");
pstmt.setString(1, pubKeyU.toString());
pstmt.setString(2, privKeyU.toString());
    pstmt.executeUpdate();
PreparedStatement pstmt1=con.prepareStatement("update dsc set pkey=?,mkey=? where id="+id+" ");
pstmt1.setString(1, pubKeyV.toString());
pstmt1.setString(2, privKeyV.toString());
    pstmt1.executeUpdate();
byte b[]=pubKeys.getEncoded();
byte b1[]=privKeys.getEncoded();

 PreparedStatement p=con.prepareStatement("insert into keygen values(?,?,?,?)");
	p.setString(1,id);
	p.setString(2,username);
	p.setString(3,pubKeys.toString());
p.setString(4,skey);
	p.executeUpdate();
//st3.executeUpdate("insert into keygen values("+id+",'"+username+"','"+pubKeys.toString()+"','"+skey+"') ");
st3.executeUpdate("update register set adminstatus='Approved' where no="+id+"");

	response.sendRedirect("UserReq.jsp?req=Approved");
	}

catch(Exception e)
{
e.printStackTrace();
	}
%>
