<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String total = "";
	
	try{
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // ����ڰ��� 
		String pw = "3208"; // ����ڰ����� �н����� // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
		
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