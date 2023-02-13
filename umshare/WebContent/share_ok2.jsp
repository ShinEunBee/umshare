<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"%>

<% // null로 초기화 한다.
	Connection conn = null; 
	
	try{ 
		// 사용하려는 데이터베이스명을 포함한 URL 기술
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String count = request.getParameter("count");
		
		conn=DriverManager.getConnection(url,id,pw); // 커넥션이 제대로 연결되면 수행된다. 
		
		String sql = "INSERT INTO SERVICE2(id,number,cnt) VALUES(?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, count);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace(); // 예외가 발생하면 예외 상황을 처리한다. 
	} 
%>

<script Type = "text/javascript">
   
 	self.window.alert("기부 예약이 완료 되었습니다.");
	window.location.href="main.jsp"; 

</script>
