<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String total = "";
	
	try{
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
		conn=DriverManager.getConnection(url,id,pw);
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from sticker";

		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()){
			total += rs.getString(1);
			total += ":::";
			total += rs.getDate(2).toString();
			total += ":::";
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}

	out.println(total);
%>