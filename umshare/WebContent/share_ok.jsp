<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="javax.mail.*" %> <%@ page import="javax.mail.internet.*" %> <%@page import="javax.mail.Authenticator" %> <%@page import="javax.mail.PasswordAuthentication" %>

<% // null로 초기화 한다.

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
		// 사용하려는 데이터베이스명을 포함한 URL 기술
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
		int daeso1 = Integer.parseInt(daeso);

		conn=DriverManager.getConnection(url,id,pw); // 커넥션이 제대로 연결되면 수행된다. 
		
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
		e.printStackTrace(); // 예외가 발생하면 예외 상황을 처리한다. 
	} 
	
	try{ 
		String st = phone; // 받는 사람 이메일 전 페이지에서 받아온거 수정 안 해서 phone로 해놈스 
		
		String sbj = "우산 대여를 완료하셨군여??"; 
		String sf = "jjanj991018@gmail.com"; // 보내는 사람(인증 정보와 동일한 email 주소여야 함!!) 
		String sMsg = "우산을 대여해주셔서 감사합니다! <br>반납 일을 꼭 지켜주시기 바랍니다. <br>반납 일 : "+strDate + "<br>    -우산쓰쉐어 드림-"; 
		
		Properties p = new Properties(); // 정보를 담을 객체 
		
		p.put("mail.smtp.user", "jjanj991018@gmail.com"); 
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		
		p.put("mail.smtp.port", "465"); 
		p.put("mail.smtp.starttls.enable","true"); // 반드시 true 
		p.put("mail.smtp.auth", "true"); 
		p.put("mail.smtp.debug", "true"); 
		
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false"); 
		
		
		//세션객체를 가져왔딩
		try { 
			
			Session mailSession = Session.getInstance(p, 
					new javax.mail.Authenticator() { 
						protected PasswordAuthentication getPasswordAuthentication() { 
							return new PasswordAuthentication("jjanj991018@gmail.com","eunbee1018"); // gmail 메일 ID / PWD 
						} 
					});
			mailSession.setDebug(true); 
			
			// 디폴트 MiMeMessage 객체를 만듦띠
			Message message = new MimeMessage(mailSession); 
			
			// 보내는 사람을 set해줌띠 
			message.setFrom(new InternetAddress(sf)); 
			
			// 보내는 사람ㅇ르 set해준다
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(st)); 
			
			// 제목을 set해줌띠
			message.setSubject(sbj); 
			
			message.setContent(sMsg, "text/html;charset=utf-8"); // 내용과 인코딩 
			
			//메세지 send 
			Transport.send(message);
		
		}catch (MessagingException e) { 
			e.printStackTrace(); 
			System.out.println("메일 발송이 안 되자너!??!?! 이유는 바로~~~~~~" + e.toString()); 
		} 
	}catch (Exception err){ 
		System.out.println(err.toString());  
	}finally { 
		//dbhandle.close(dbhandle.con); 
	} 
%>

<script Type = "text/javascript">
   
 	self.window.alert("대여 예약이 완료 되었습니다. <br> 메일을 확인해주세요!");
	window.location.href="main.jsp"; 

</script>