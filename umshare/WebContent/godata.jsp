<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String an_id = request.getParameter("id");
	String msg="";

	try{
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
		conn=DriverManager.getConnection(url,id,pw);
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from service where loc = 1";

		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		msg = "no";
		
		while(rs.next()){
			 if(an_id.equals(rs.getString("id"))){
				 msg = "ok";
				 break;
			 }
		}
		

	}catch(Exception e){
		e.printStackTrace();
	}

	out.println(msg);
%>