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
		String id = "root"; // 사용자계정 
		String pw = "3208"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
		Class.forName("com.mysql.jdbc.Driver"); // DriverManager 객체로부터 Connection 객체를 얻어온다. 
		
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
	var marker = null; //사용자 위치 넣을 변수
	var markers = 0; //현재 지도상에 사용자 마커가 찍혀있나 안 찍혀있나 볼때 쓸 변수
	var pyo = [4]; //마커 배열
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
			alert("대여 가능한 우산이 없어요!ㅠㅠ  다른 대여소를 선택해주세요!");
		}else{
			if(idx == 1){
				document.getElementById('daeso').value = "인하공전 대여소";
			}else if(idx == 2){
				document.getElementById('daeso').value = "인하대학교 대여소";
			}else if(idx == 3){
				document.getElementById('daeso').value = "인하대학교 후문 문화의 거리 대여소";
			}else if(idx == 4){
				document.getElementById('daeso').value = "멀리 있는 대여소";
			}else{
				alert("선택 제대로 안 한 듯");
			}
		}
	}
	
	function choice2(){
		if(document.getElementById('gagga').innerHTML == "인하공전 대여소"){
			document.getElementById('daeso').value = "인하공전 대여소";
		}else if(document.getElementById('gagga').innerHTML == "인하대학교 대여소"){
			document.getElementById('daeso').value = "인하대학교 대여소";
		}else if(document.getElementById('gagga').innerHTML == "인하대학교 후문 문화의 거리 대여소"){
			document.getElementById('daeso').value = "인하대학교 후문 문화의 거리 대여소";
		}else if(document.getElementById('gagga').innerHTML == "멀리 있는 대여소"){
			document.getElementById('daeso').value = "멀리 있는 대여소";
		}else{
			alert("일단 검색 먼저 하세영");
		}
		
	}
    
	
	
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	//여기부터 구글 맵!!!!!!!!!!!!!!!!!!!!!
	
	
    function initMap() {
    	
		//geocoder 사용하는 이유 : 구글 맵 상에 마커를 찍으려면 '인하대학교' 같은 우편상 주고 말고 위도 경도상 주소가 있어야하는데 나는 검색 기능이 있어서 사용자가 검색한 위치를 위도 경도로 바꿔주려고 지오코딩이 있는겨!
    	var geocoder = new google.maps.Geocoder(); // 장소 검색 했을 때  '인하대학교 ' 이렇게 입력한 걸 ' 위도,경도 ' 로 바꿔주는 애!!!!
    	
        var myLatLng = {lat: 37.448186, lng: 126.657450}; //각 마커들 주소...!!! 
        var inhaso = {lat: 37.451285, lng:  126.656336 }; //만약에 DB에 주소들 있으면 꺼내다가 쓰면 될 것 같어! 아마 그건 자바스크립트 내에서만은 안 될지도 몰라...!!!
        var humunso = {lat: 37.452200, lng: 126.657299 };
        var mulso = {lat: 37.452105, lng: 126.654148 };
        
        pyo[0] = myLatLng; //마커 배열에 하나씩 넣어놨더
        pyo[1] = inhaso;
        pyo[2] = humunso;
        pyo[3] = mulso;
        

        var map = new google.maps.Map(document.getElementById('map'), {
          center: humunso,
          zoom: 16
        });

        //이 밑에 네개는 그냥 원래 찍어놓은 마커 ...
        var inhatcdae = new google.maps.Marker({
          map: map, //구글 맵 위에 할래영
          position: myLatLng, //마커 위치
          title: '인하공전 대여소' //마우스 갖다대면 노랗게(?) 뜨는 설명
        });
        
        var inhadae = new google.maps.Marker({
            map: map,
            position: inhaso,
            title: '인하대학교 후문 대여소'
        });
        
        var humundae = new google.maps.Marker({
            map: map,
            position: humunso,
            title: '인하 문화의 거리 대여소'
        });
        
        var muldae = new google.maps.Marker({
            map: map,
            position: mulso,
            title: '멀리 있는 대여소'
        });
        
        dae[0] = inhatcdae;
        dae[1] = inhadae;
        dae[2] = humundae;
        dae[3] = muldae;
        
        
        document.getElementById('submit').addEventListener('click',function() {geocodeAddress(geocoder, map); });
        
        
        //얘네는 마커 클릭 했을 때 이벤트 넣는 함수들!!!!!!!
        inhatcdae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "인하공전 대여소를 선택하시겠습니까? <br> 위치 : 인천광역시 남구 학익1동 인하로100";
        	document.getElementById('count').innerHTML = "남은 갯수 : "+ cnt1;
        	idx = 1;
        	cnt = cnt1;
        });
        
        inhadae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "인하대후문 대여소를 선택하시겠습니까? <br> 위치 :  인천광역시 용현1.4동";
        	document.getElementById('count').innerHTML = "남은 갯수 : "+ cnt2;
        	idx = 2;
        	cnt = cnt2;
        });
        
        humundae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "인하대학교 후문 문화의 거리 대여소를 선택하시겠습니까? <br> 위치 : 인천광역시 남구 용현동 인하로 77번길 21";
        	document.getElementById('count').innerHTML = "남은 갯수 : "+ cnt3;
        	idx = 3;
        	cnt = cnt3;
        });
        
        muldae.addListener('click', function(){
        	document.getElementById('choice').innerHTML = "멀리 있는 대여소를 선택하시겠습니까? <br> 위치 : 인천광역시 남구 용현1.4동 인하로 51";
        	document.getElementById('count').innerHTML = "남은 갯수 : "+ cnt4;
        	idx = 4;
        	cnt = cnt4;
        });
        
    }
    
    
    //여기부터 그 검색 창에 원하는 위치 검색하면 그 위치에 마커 찍어주는 거!!!!
    //여기서 써먹는 변수들은 엄청 위에 거의 코드 맨 위에 선언 돼 있긔!
    function geocodeAddress (geocoder, resultsMap) {
    	var bun = 0;
    	if(markers != 0){ //만약에 사용자 마커가 이미 찍혀있으면!!
    		marker.setOptions({
    			map : null, 
    			visible : false
    		}); //맵 상에서 안 보이게 해주는 거
    		marker = null; //사용자 위치 마커 변수 null 로 초기화!!
    		markers = 0; //다시 사용자 마커 있는지 없는지 검사해주는 변수를 0으로!!
    	}
    	var address = document.getElementById('address').value;  //이거 그 텍스트 박스에 사용자가 입력한 위치!!! ex.인하대학교  	
    	geocoder.geocode({'address' : address}, function(results, status) { 
    		if(status == 'OK') {    			
    			resultsMap.setCenter(results[0].geometry.location);    			
    			marker = new google.maps.Marker({ //사용자 위치 담는 마커 변수에다가 사용자가 입력한 거 넣어주는 겨!!! 
    				map : resultsMap,
    				position:results[0].geometry.location, //result[0]이 사용자가 입력한 위치고 그걸 geometry.location으로 위도 경도로 바꿔주는 것 같오
    				title : '사용자의 위치입니다.' //title은 걍... 뭐라하지 마우스 올렸을 때 그 보여지는 설명..?! 같은 고야!!!
    			});
    			markers = 1;
    			for(var i=0; i<pyo.length; i++){ //이 for문은 내가 사용자의 현재 위치에서 가장 가까운 마커 추천해주는 기능이 있어가지구 넣은 포문!!! 안 넣어도 상관 없는고애!!!
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
    			alert("위치를 다시 입력해주세요.");
    		}
    	});
    }
    

    
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>원하는 대여소를 선택하세요!</title>
</head>
<body style="background-color:#F2F4F7;">
<div class = "backyung">
	<div>
		<input id = "address" type = "text" value="">
		<input id="submit" type = "button" value="주소 검색">
	</div>
	
	<div id="map" style="width: 100%; height: 400px;">
		<script src="https://maps.googleapis.com/maps/api/js?libraries=geometry&key=AIzaSyBQlclTQryAFxiipnIcMcO6k2BUQglqK1s&callback=initMap"
	        async defer></script>
	</div>
	        
	<div class = "wrapper">
		<div class = "one">
			<pre>가장 가까운 대여소는?</pre>
		</div>
		<div class="two">
			<pre id="gagga">위치를 입력해주세요!</pre>
		</div>
		<div class="three">
			<input type="button" value="선택" class="onebtn" Onclick="choice2();">
		</div>
	</div>
	
	<div class="wrapper" style="width:100%; height:100px;">
		<div class="one">
			<pre id="choice">원하는 대여소를 선택해주세요!</pre>
		</div>
		<div class="two">
			<pre id="count">남은 갯수</pre>
		</div>
		<div class="three">
			<input type="button" value="선택" OnClick = "choice();" class="onebtn">
		</div>
	</div>
	
	<div>
		<form name="form_dae">
			이 대여소가 맞다면 확인을 눌러주세요!<input type="text" id="daeso">
			<div>
				<input type="button" value="확인" OnClick="end();" class = "lastbtn">
			</div>
		</form>
	</div>
</div>
</body>
</html>