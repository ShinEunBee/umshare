<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="sharejs1.js" charset='EUC-KR'></script>
<link rel="stylesheet" href="sharecss1.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��꾲����!</title>
</head>
<body style="background-color:#F2F4F7;">


<div style="width:100%">
	<img src = "image/logo.png" style="width:200px; height:auto; margin-left:auto; margin-right:auto; display:block;">
</div>

<div class ="backnemo">	

	<div>
		<img src="image/daeimg.png" id="topimage" style = "width:70%; margin-left:auto; margin-right:auto; display:block;">
	</div>

	<div>
		<br>
		<br>
		<input type="radio" name="dae" value="1" checked="checked">�뿩
		<input type="radio" name="dae" value="2" >���
	</div>

	
	<div>
		<br>
		<hr width = 100% color = "#D5D5D5" align = "center" size = "1"/>
		<br>
	</div>
	
	<div id="daeform" >
		<form name ="formdae" method="post" action="share_ok.jsp">
			<div style="width:100%;  text-align : left;">
				<pre style="margin-left:40%;">���̵�       <input type="text" id = "name" name="name">  <input type="button" class = "snip153" value="�뿩 Ȯ��" Onclick ="idCheck();"></pre>
			</div>
			<br>
			<br>
			<br>
			<div style="width:100%; text-align : left;">
				<pre style="margin-left:40%;">�̸���      <input type="text" name="phone"></pre>
			</div>
			<br>
			<br>
			<br>
			<div style="width:100%;  text-align : left;">
				<pre style="margin-left:40%;">�뿩�� ��ġ  <input type="text" name="share_form" Onclick="zidopopup();"></pre>
				<input type="text" name="share_form2" style="visibility: hidden;">
			</div>
			
			<br>
			<br>
			<div>
				<br>
				<hr width = 100% color = "#D5D5D5" align = "center" size = "1"/>
				<br>
			</div>
			<div>
				<input type="button" class = "snip1535" value="SHARE" OnClick="Check();">
			</div>
		</form>
	</div>

	
	<div id ="ggiform" style="display:none;">
		<form name ="formggi" method="post" action="share_ok2.jsp">
			<div style="width:100%;  text-align : left;">
				<pre style="margin-left:40%;">���̵�       <input type="text" name="name"></pre>
			</div>
			<br>
			<br>
			<br>
			<div style="width:100%; text-align : left;">
				<pre style="margin-left:40%;">��ȭ��ȣ     <input type="text" name="phone" ></pre>
			</div>  
			<br>
			<br>
			<br>
			<div style="width:100%;  text-align : left;">
				<pre style="margin-left:40%;">��� ����    <select name="count" style="width:155px;">
					<option value="1">1��</option>
					<option value="2">2��</option>
					<option value="3">3��</option>
					<option value="4">4��</option>
					<option value="5">5��</option>
				</select>
				</pre>
			</div>
			<div>
				<br>
				<br>
				<br>
				<hr width = 100% color = "#D5D5D5" align = "center" size = "1"/>
				<br>
			</div>
			<div>
				<input type="button" class = "snip1535" value="SHARE" OnClick="Check2();">
			</div>
		</form>
	</div>
</div>
</body>
</html>