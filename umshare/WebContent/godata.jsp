<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	String an_id = request.getParameter("id");
	String msg="";

	try{
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // ����ڰ��� 
		String pw = "3208"; // ����ڰ����� �н����� // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
		
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