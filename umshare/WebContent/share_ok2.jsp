<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"%>

<% // null�� �ʱ�ȭ �Ѵ�.
	Connection conn = null; 
	
	try{ 
		// ����Ϸ��� �����ͺ��̽����� ������ URL ���
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // ����ڰ��� 
		String pw = "3208"; // ����ڰ����� �н����� // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String count = request.getParameter("count");
		
		conn=DriverManager.getConnection(url,id,pw); // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�. 
		
		String sql = "INSERT INTO SERVICE2(id,number,cnt) VALUES(?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, phone);
		pstmt.setString(3, count);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace(); // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�. 
	} 
%>

<script Type = "text/javascript">
   
 	self.window.alert("��� ������ �Ϸ� �Ǿ����ϴ�.");
	window.location.href="main.jsp"; 

</script>
