<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="javax.mail.*" %> <%@ page import="javax.mail.internet.*" %> <%@page import="javax.mail.Authenticator" %> <%@page import="javax.mail.PasswordAuthentication" %>

<% // null�� �ʱ�ȭ �Ѵ�.

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String daeso = request.getParameter("share_form2");

	java.util.Date date = new java.util.Date();
	date.setDate(date.getDate() + 2);
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strDate = simpleDate.format(date);

	Connection conn = null; 
	int share1 = 0;	

	try{ 
		// ����Ϸ��� �����ͺ��̽����� ������ URL ���
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // ����ڰ��� 
		String pw = "3208"; // ����ڰ����� �н����� // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
		
		int daeso1 = Integer.parseInt(daeso);

		conn=DriverManager.getConnection(url,id,pw); // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�. 
		
		String sql = "INSERT INTO SERVICE(id,loc,mail,date) VALUES(?,?,?,?)";
		
		String sql2 = "UPDATE DAESO SET CUMCNT = CUMCNT-1 WHERE DAESONAME = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		
		pstmt.setString(1, name);
		pstmt.setInt(2, daeso1);
		pstmt.setString(3, phone);
		pstmt.setString(4, strDate);
		
		pstmt2.setInt(1,daeso1);
		
		pstmt.execute();
		pstmt.close();
		
		pstmt2.execute();
		pstmt2.close();

		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace(); // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�. 
	} 
	
	try{ 
		String st = phone; // �޴� ��� �̸��� �� ���������� �޾ƿ°� ���� �� �ؼ� phone�� �س� 
		
		String sbj = "��� �뿩�� �Ϸ��ϼ̱���??"; 
		String sf = "jjanj991018@gmail.com"; // ������ ���(���� ������ ������ email �ּҿ��� ��!!) 
		String sMsg = "����� �뿩���ּż� �����մϴ�! <br>�ݳ� ���� �� �����ֽñ� �ٶ��ϴ�. <br>�ݳ� �� : "+strDate + "<br>    -��꾲���� �帲-"; 
		
		Properties p = new Properties(); // ������ ���� ��ü 
		
		p.put("mail.smtp.user", "jjanj991018@gmail.com"); 
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		
		p.put("mail.smtp.port", "465"); 
		p.put("mail.smtp.starttls.enable","true"); // �ݵ�� true 
		p.put("mail.smtp.auth", "true"); 
		p.put("mail.smtp.debug", "true"); 
		
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false"); 
		
		
		//���ǰ�ü�� �����Ե�
		try { 
			
			Session mailSession = Session.getInstance(p, 
					new javax.mail.Authenticator() { 
						protected PasswordAuthentication getPasswordAuthentication() { 
							return new PasswordAuthentication("jjanj991018@gmail.com","eunbee1018"); // gmail ���� ID / PWD 
						} 
					});
			mailSession.setDebug(true); 
			
			// ����Ʈ MiMeMessage ��ü�� �����
			Message message = new MimeMessage(mailSession); 
			
			// ������ ����� set���ܶ� 
			message.setFrom(new InternetAddress(sf)); 
			
			// ������ ������� set���ش�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(st)); 
			
			// ������ set���ܶ�
			message.setSubject(sbj); 
			
			message.setContent(sMsg, "text/html;charset=utf-8"); // ����� ���ڵ� 
			
			//�޼��� send 
			Transport.send(message);
		
		}catch (MessagingException e) { 
			e.printStackTrace(); 
			System.out.println("���� �߼��� �� ���ڳ�!??!?! ������ �ٷ�~~~~~~" + e.toString()); 
		} 
	}catch (Exception err){ 
		System.out.println(err.toString());  
	}finally { 
		//dbhandle.close(dbhandle.con); 
	} 
%>

<script Type = "text/javascript">
   
 	self.window.alert("�뿩 ������ �Ϸ� �Ǿ����ϴ�. <br> ������ Ȯ�����ּ���!");
	window.location.href="main.jsp"; 

</script>