<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	
	String idchk = request.getParameter("id");
	
	int chk = 0;

	try{
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
		conn=DriverManager.getConnection(url,id,pw);
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from service";

		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		chk = 2;
		
		while(rs.next()){
			 if(idchk.equals(rs.getString("id"))){
				 chk = 1;
				 break;
			 }
		}
		
		

	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우산 대여 확인</title>
</head>
<style>
.backyung{
	margin-top :10px;
	margin-left : 10px;
	margin-right:10px;
	padding-top : 20px;
	padding-left : 20px;
	padding-right:20px;
	padding-bottom:30px;
	background-color:#FFFFFF;
	text-align:center;
	border: 1px solid #D5D5D5;
}

.snip153 {
  background-color: #165E74;
  border: none;
  color: #F2F4F7;
  cursor: pointer;
  display: inline-block;
  font-size: 1em;
  font-size: 10px;
  outline: none;
  padding: 5px 15px 5px;
  position: relative;
}
</style>

<body style="background-color:#F2F4F7;">
<div class = "backyung">
	<div>
		<div>
			<pre id= "now">대여 중인지 판별합니다.</pre>
		</div>
		<div>
			<input type="button" value="확인" class="snip153" OnClick="end();">
		</div>
	</div>
</div>
</body>

<SCRIPT LANGUAGE="javascript">
	
	var idchk = <%=chk%>;
	var id = "<%=idchk%>";
	
	if(idchk == 2){
		document.getElementById('now').innerHTML = id + "는(은) 현재 우산 대여 가능한 아이디 입니다.";
	}else{
		document.getElementById('now').innerHTML = id + "는(은) 현재 우산을 대여할 수 없는 아이디 입니다. <br> 아이디를 다시 확인하시거나 우산을 반납하세요.";
	}
	
	function end(){
		if(idchk == 1){
			window.opener.document.formdae.name.value = null;
		}
		self.close();
	}
	

</SCRIPT>
</html>