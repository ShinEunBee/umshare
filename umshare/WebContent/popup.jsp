<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;
	
	int cnt1 = 0;
	int cnt2 = 0;
	int cnt3 = 0;
	int cnt4 = 0;

	try{
		
		String url = "jdbc:mysql://localhost:3306/umshare"; 
		String id = "root"; // ����ڰ��� 
		String pw = "3208"; // ����ڰ����� �н����� // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager ��ü�κ��� Connection ��ü�� ���´�. 
		
		conn=DriverManager.getConnection(url,id,pw);
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from daeso";

		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		int[] arr = new int[4];
		int i = 0;
		
		while(rs.next()){
			arr[i] = rs.getInt("cumcnt");
			 i++;
		}
		
		cnt1 = arr[0];
		cnt2 = arr[1];
		cnt3 = arr[2];
		cnt4 = arr[3];
		

	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>

.lastbtn{
	background-color: #165E74;
  	border: none;
  	color: #F2F4F7;
  	cursor: pointer;
  	display: inline-block;
  	font-size: 1em;
  	font-size: 15px;
  	margin: 15px 40px;
  	outline: none;
  	padding: 12px 40px 10px;
  	position: relative;
  	font-weight: 700;
}

.onebtn{
	background-color: #F2F4F7;
  	border-style: insert;
  	border-width:1px;
  	border-color:#165E74;
  	color: #165E74;
  	cursor: pointer;
	font-size: 11px;
  	margin: 15px 40px;
  	outline: none;
  	padding: 10px 30px 8px;
  	position: relative;
  	font-weight: 700;
}

.backyung{
	margin-top :10px;
	margin-left : 10px;
	margin-right:10px;
	padding-top : 50px;
	padding-left : 20px;
	padding-right:20px;
	padding-bottom:50px;
	background-color:#FFFFFF;
	text-align:center;
	border: 1px solid #D5D5D5;
}

.wrapper{
	display : grid;
	grid-template-columns:35% 35% 30%;
	text-align:center;
}

.wrapper2{
	display : grid;
	grid-template-columns:70% 30%;
	text-align:center;
}

.one{
	grid-column:1;
	grid-row:1;
}

.two{
	grid-column:2;
	grid-row :1;
}

.three{
	grid-column:3;
	grid-row :1;
}
</style>
<head>
<SCRIPT LANGUAGE="javascript">

	var idx = 0;
	var marker = null; //����� ��ġ ���� ����
	var markers = 0; //���� ������ ����� ��Ŀ�� �����ֳ� �� �����ֳ� ���� �� ����
	var pyo = [4]; //��Ŀ �迭
	var max = 10;
	var dae = [4];
	var cnt = 0;

	var cnt1 = "<%=cnt1%>";
	var cnt2 = "<%=cnt2%>";
	var cnt3 = "<%=cnt3%>";
	var cnt4 = "<%=cnt4%>";

	function end(){
		window.opener.document.formdae.share_form.value = document.form_dae.daeso.value;
		window.opener.document.formdae.share_form2.value = idx;
		self.close();
	}
	
	function choice(){
		if(cnt <= 0){
			alert("�뿩 ������ ����� �����!�Ф�  �ٸ� �뿩�Ҹ� �������ּ���!");
		}else{
			if(idx == 1){
				document.getElementById('daeso').value = "���ϰ��� �뿩��";
			}else if(idx == 2){
				document.getElementById('daeso').value = "���ϴ��б� �뿩��";
			}else if(idx == 3){
				document.getElementById('daeso').value = "���ϴ��б� �Ĺ� ��ȭ�� �Ÿ� �뿩��";
			}else if(idx == 4){
				document.getElementById('daeso').value = "�ָ� �ִ� �뿩��";
			}else{
				alert("���� ����� �� �� ��");
			}
		}
	}
	
	function choice2(){
		if(document.getElementById('gagga').innerHTML == "���ϰ��� �뿩��"){
			document.getElementById('daeso').value = "���ϰ��� �뿩��";
		}else if(document.getElementById('gagga').innerHTML == "���ϴ��б� �뿩��"){
			document.getElementById('daeso').value = "���ϴ��б� �뿩��";
		}else if(document.getElementById('gagga').innerHTML == "���ϴ��б� �Ĺ� ��ȭ�� �Ÿ� �뿩��"){
			document.getElementById('daeso').value = "���ϴ��б� �Ĺ� ��ȭ�� �Ÿ� �뿩��";
		}else if(document.getElementById('gagga').innerHTML == "�ָ� �ִ� �뿩��"){
			document.getElementById('daeso').value = "�ָ� �ִ� �뿩��";
		}else{
			alert("�ϴ� �˻� ���� �ϼ���");
		}
		
	}
    
	
	
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	//������� ���� ��!!!!!!!!!!!!!!!!!!!!!
	
	
    function initMap() {
    	
		//geocoder ����ϴ� ���� : ���� �� �� ��Ŀ�� �������� '���ϴ��б�' ���� ����� �ְ� ���� ���� �浵�� �ּҰ� �־���ϴµ� ���� �˻� ����� �־ ����ڰ� �˻��� ��ġ�� ���� �浵�� �ٲ��ַ��� �����ڵ��� �ִ°�!
    	var geocoder = new google.maps.Geocoder(); // ��� �˻� ���� ��  '���ϴ��б� ' �̷��� �Է��� �� ' ����,�浵 ' �� �ٲ��ִ� ��!!!!
    	
        var myLatLng = {lat: 37.448186, lng: 126.657450}; //�� ��Ŀ�� �ּ�...!!! 
        var inhaso = {lat: 37.451285, lng:  126.656336 }; //���࿡ DB�� �ּҵ� ������ �����ٰ� ���� �� �� ����! �Ƹ� �װ� �ڹٽ�ũ��Ʈ ���������� �� ������ ����...!!!
        var humunso = {lat: 37.452200, lng: 126.657299 };
        var mulso = {lat: 37.452105, lng: 126.654148 };
        
        pyo[0] = myLatLng; //��Ŀ �迭�� �ϳ��� �־����
        pyo[1] = inhaso;
        pyo[2] = humunso;
        pyo[3] = mulso;
        

        var map = new google.maps.Map(document.getElementById('map'), {
          center: humunso,
          zoom: 16
        });

        //�� �ؿ� �װ��� �׳� ���� ������ ��Ŀ ...
        var inhatcdae = new google.maps.Marker({
          map: map, //���� �� ���� �ҷ���
          position: myLatLng, //��Ŀ ��ġ
          title: '���ϰ��� �뿩��' //���콺 ���ٴ�� �����(?) �ߴ� ����
        });
        
        var inhadae = new google.maps.Marker({
            map: map,
            position: inhaso,
            title: '���ϴ��б� �Ĺ� �뿩��'
        });
        
        var humundae = new google.maps.Marker({
            map: map,
            position: humunso,
            title: '���� ��ȭ�� �Ÿ� �뿩��'
        });
        
        var muldae = new google.maps.Marker({
            map: map,
            position: mulso,
            title: '�ָ� �ִ� �뿩��'
        });
        
        dae[0] = inhatcdae;
        dae[1] = inhadae;
        dae[2] = humundae;
        dae[3] = muldae;
        
        
        document.getElementById('submit').addEventListener('click',function() {geocodeAddress(geocoder, map); });
        
        
        //��״� ��Ŀ Ŭ�� ���� �� �̺�Ʈ �ִ� �Լ���!!!!!!!
        inhatcdae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "���ϰ��� �뿩�Ҹ� �����Ͻðڽ��ϱ�? <br> ��ġ : ��õ������ ���� ����1�� ���Ϸ�100";
        	document.getElementById('count').innerHTML = "���� ���� : "+ cnt1;
        	idx = 1;
        	cnt = cnt1;
        });
        
        inhadae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "���ϴ��Ĺ� �뿩�Ҹ� �����Ͻðڽ��ϱ�? <br> ��ġ :  ��õ������ ����1.4��";
        	document.getElementById('count').innerHTML = "���� ���� : "+ cnt2;
        	idx = 2;
        	cnt = cnt2;
        });
        
        humundae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "���ϴ��б� �Ĺ� ��ȭ�� �Ÿ� �뿩�Ҹ� �����Ͻðڽ��ϱ�? <br> ��ġ : ��õ������ ���� ������ ���Ϸ� 77���� 21";
        	document.getElementById('count').innerHTML = "���� ���� : "+ cnt3;
        	idx = 3;
        	cnt = cnt3;
        });
        
        muldae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "�ָ� �ִ� �뿩�Ҹ� �����Ͻðڽ��ϱ�? <br> ��ġ : ��õ������ ���� ����1.4�� ���Ϸ� 51";
        	document.getElementById('count').innerHTML = "���� ���� : "+ cnt4;
        	idx = 4;
        	cnt = cnt4;
        });
        
    }
    
    
    //������� �� �˻� â�� ���ϴ� ��ġ �˻��ϸ� �� ��ġ�� ��Ŀ ����ִ� ��!!!!
    //���⼭ ��Դ� �������� ��û ���� ���� �ڵ� �� ���� ���� �� �ֱ�!
    function geocodeAddress (geocoder, resultsMap) {
    	var bun = 0;
    	if(markers != 0){ //���࿡ ����� ��Ŀ�� �̹� ����������!!
    		marker.setOptions({
    			map : null, 
    			visible : false
    		}); //�� �󿡼� �� ���̰� ���ִ� ��
    		marker = null; //����� ��ġ ��Ŀ ���� null �� �ʱ�ȭ!!
    		markers = 0; //�ٽ� ����� ��Ŀ �ִ��� ������ �˻����ִ� ������ 0����!!
    	}
    	var address = document.getElementById('address').value;  //�̰� �� �ؽ�Ʈ �ڽ��� ����ڰ� �Է��� ��ġ!!! ex.���ϴ��б�  	
    	geocoder.geocode({'address' : address}, function(results, status) { 
    		if(status == 'OK') {    			
    			resultsMap.setCenter(results[0].geometry.location);    			
    			marker = new google.maps.Marker({ //����� ��ġ ��� ��Ŀ �������ٰ� ����ڰ� �Է��� �� �־��ִ� ��!!! 
    				map : resultsMap,
    				position:results[0].geometry.location, //result[0]�� ����ڰ� �Է��� ��ġ�� �װ� geometry.location���� ���� �浵�� �ٲ��ִ� �� ����
    				title : '������� ��ġ�Դϴ�.' //title�� ��... �������� ���콺 �÷��� �� �� �������� ����..?! ���� ���!!!
    			});
    			markers = 1;
    			for(var i=0; i<pyo.length; i++){ //�� for���� ���� ������� ���� ��ġ���� ���� ����� ��Ŀ ��õ���ִ� ����� �־���� ���� ����!!! �� �־ ��� ���°��!!!
    				var nowlat = results[0].geometry.location.lat();
        			var nowlng = results[0].geometry.location.lng();
        			
        			var nextlat = pyo[i].lat; 
        			var nextlng = pyo[i].lng;
        			
        			var chlat = (nowlat - nextlat)*(nowlat - nextlat);
        			var chlng = (nowlng - nextlng)*(nowlng - nextlng);
        			
        			var zuapyo = Math.sqrt(chlat+chlng);
        			
        			if(max > zuapyo){
        				max = zuapyo;
        				bun = i;
        			}else{
        				max = max;
        			}
    			}
    			document.getElementById('gagga').innerHTML = dae[bun].title;
    		}else {    			
    			alert("��ġ�� �ٽ� �Է����ּ���.");
    		}
    	});
    }
    

    
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ϴ� �뿩�Ҹ� �����ϼ���!</title>
</head>
<body style="background-color:#F2F4F7;">
<div class = "backyung">
	<div>
		<input id = "address" type = "text" value="">
		<input id="submit" type = "button" value="�ּ� �˻�">
	</div>
	
	<div id="map" style="width: 100%; height: 400px;">
		<script src="https://maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyBQlclTQryAFxiipnIcMcO6k2BUQglqK1s&callback=initMap"
	        async defer></script>
	</div>
	        
	<div class = "wrapper">
		<div class = "one">
			<pre>���� ����� �뿩�Ҵ�?</pre>
		</div>
		<div class="two">
			<pre id="gagga">��ġ�� �Է����ּ���!</pre>
		</div>
		<div class="three">
			<input type="button" value="����" class="onebtn" Onclick="choice2();">
		</div>
	</div>
	
	<div class="wrapper" style="width:100%; height:100px;">
		<div class="one">
			<pre id="choice">���ϴ� �뿩�Ҹ� �������ּ���!</pre>
		</div>
		<div class="two">
			<pre id="count">���� ����</pre>
		</div>
		<div class="three">
			<input type="button" value="����" OnClick = "choice();" class="onebtn">
		</div>
	</div>
	
	<div>
		<form name="form_dae">
			�� �뿩�Ұ� �´ٸ� Ȯ���� �����ּ���!<input type="text" id="daeso">
			<div>
				<input type="button" value="Ȯ��" OnClick="end();" class = "lastbtn">
			</div>
		</form>
	</div>
</div>
</body>
</html>