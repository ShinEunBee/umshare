
$(document).ready(function(){

	$("input:radio[name=dae]").click(function(){
		
		var chkValue = $('input[name="dae"]:checked').val();
		
		if(chkValue == "1"){
			$('#daeform').css('display','block');
			$('#ggiform').css('display','none');
			document.getElementById("topimage").src = "image/daeimg.png";
		}
		else if(chkValue=="2"){
			$('#daeform').css('display','none');
			$('#ggiform').css('display','block');
			document.getElementById("topimage").src = "image/ggiimg.png";
		}
		
	});

});


var clickcnt = 0; 


function zidopopup(){
	window.open("http://jjanj7.cafe24.com/popup.jsp","","width=800 height=500 menubar=1");
}

function idCheck(){
	var id = document.getElementById("name").value;
	window.open("http://jjanj7.cafe24.com/idCheck.jsp?id="+id,"","width=450 height=200 menubar=1");
	clickcnt = 1;
}

function Check()
{
	var form = document.formdae;
	if( !form.name.value )
	{
		alert( "아이디를 적어주세요." );
		form.name.focus();
		return;
	}
	if( !form.phone.value )
	{
		alert( "비밀번호를 적어주세요." );
		form.phone.focus();
		return;
	}
	if(clickcnt == 0){
		alert("아이디 중복검사를 해주세요.");
		form.name.focus();
		return;
	}
	form.submit();
}

function Check2()
{
	var form = document.formggi;
	if( !form.name.value )
	{
		alert( "이름을 적어주세요" );
		form.name.focus();
		return;
	}
	if( !form.phone.value )
	{
		alert( "비밀번호를 적어주세요" );
		form.phone.focus();
		return;
	}
	form.submit();
}
