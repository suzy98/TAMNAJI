<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
@font-face {
    font-family: 'NanumSquareRound';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
:root {
  --text-color: black;
  --background-color: #f8ded2;
  --accent-color: #ff4d00;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'NanumSquareRound';
}
#email, #email-2, #emailcheck, #password, #password-confirm, #nickname, #birthday, #mail-check-warn1, #mail-check-warn2 {
   font-family: 'NanumSquareRound';
}
.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  border-radius: 40px;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
 font-family: 'NanumSquareRound';
  outline: 0;
  background: #F2F2F2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  border-radius: 20px;
  font-size: 14px;
}
.form button {
  text-transform: uppercase;
  outline: 0;
  background: #80ca6a;
  width: 100%;
  border: 0;
  border-radius: 20px;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: green;
}
.form .message {
  margin: 15px 0 0;
  color: #B3B3B3;
  font-size: 13px;
}
.form .message a {
  color: GREEN;
  font-weight: bold;
  text-decoration: none;
}
.form .message a:hover {
  cursor: pointer;
}
.form .register-form,
.form .find-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1A1A1A;
}
.container .info span {
  color: #4D4D4D;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: green; /* fallback for old browsers */
  background: green;
  background: linear-gradient(90deg, rgb(183, 226, 159) 0%, rgb(185, 229, 160) 50%);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
} 
#email-2, #nickname {
  width: 205px;
  float: left;
  border-top-right-radius: 1px;
  border-bottom-right-radius:1px;
  margin-right: 0;
}
#email-2 {
    height: 46.67px;
}
#confirm {
  width: 65px;
  height: 46.67px;
  box-sizing: border-box;
  background: #80ca6a;
  border-top-left-radius:1px;
  border-bottom-left-radius:1px;
}
#confirm:hover {
  background-color: green;
}
  #saveId-form {
  	display: grid;
    width: 110px;
    grid-template-columns: 10% 90%;
    font-family: 'NanumSquareRound';
    font-size: 13px;
    padding: 15px 15px 15px 0px;
    margin-right: 130px;
  }

  #saveId-form>label{  font-family: 'NanumSquareRound'; padding-right: 5px;}
  #saveId{    margin: 4px 4px 4px 0px; }

  #mail-check-warn1, #mail-check-warn2, #pw-check-warn, #name-Check-Btn, #nn-check-warn { font-size: 12px; }

*{ cursor: url('data:image/x-icon;base64,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AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA////v////5////+f////n////4D///+D////j////x////w///HwP//jwH//4gB/gAAAfwAAAP/AAAH/wAAD/8AAB//gAA//8AA///4A////4H////A////8H/9/////f////3////8P//////////////////////////////8='), auto; }

</style>
</head>
<body>
	<div class="login-page">
	  <div class="form">
		<form class="register-form" action="insert.me" method="post">
		  <p style="margin-bottom: 10px; font-size: 15px;" >🍊 제주 공간 대여 플랫폼 🍊<br></p>
	      <p style="margin-bottom: 50px;"><a href="/tamnaji" style="font-weight: bold; color: #fd6500; text-decoration: none">탐나지</a>에 오신 것을 환영합니다!</p>
	      <div>
	      <input type="email" id="email-2" name="memberId" placeholder="이메일" />
          <button type="button" class="mail-Check-Btn" id="confirm" style="margin-bottom: 10px">인증</button>
          </div><br>
	      <div id="mail-check-warn1"></div>
          <input type="text" id="emailcheck" name="emailcheck" placeholder="인증번호 6자리" disabled="disabled" maxlength="6" />
	      <div id="mail-check-warn2"></div>
	      <input type="password" id="password" name="memberPwd" placeholder="비밀번호" />
	      <input type="password" id="password-confirm" name="password-confirm" placeholder="비밀번호 확인" />
	      <div id="pw-check-warn"></div>
	      <div>
	      <input type="text" id="nickname" name="nickname" placeholder="닉네임(2글자 이상)" minlength="2" maxlength="10" />
	      <button type="button" class="name-Check-Btn" id="confirm" style="margin-bottom: 10px">확인</button>
	      </div><br>
	      <div id="nn-check-warn"></div>
	      <input type="text" id="birthday" name="birthday" placeholder="생년월일 8자리  ex)19980120" />
			
	      <button type="submit" >회원가입</button>
	      <p class="message">이미 탐나지 회원이신가요? <a href="#" class="back">로그인</a></p>
        </form>
        <form class="login-form" action="login.me" method="post">
          <div style="height: 200px;" onclick="location.href='/tamnaji';">
          <img src="resources/images/login-logo.png" style="width: 150px;">
          </div>
          <input type="email" id="email" name="memberId" placeholder="이메일" value="${cookie.saveId.value}"/>
          <input type="password" id="password_" name="memberPwd" placeholder="비밀번호" />
          <div id='saveId-form'>
			<c:choose>
				<c:when test="${cookie.saveId.value != null}">
					<input type="checkbox" name='saveId' value='y' id='saveId' checked><label for='saveId'>아이디 저장</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name='saveId' value='y' id='saveId'><label for='saveId'>아이디 저장</label>	
				</c:otherwise>
			</c:choose>
          </div>
          <button type="submit">로그인</button>
          <br>
          <p class="message">아직 탐나지 회원이 아니신가요? <a href="#" class="back">회원가입</a></p>
          <p class="message" style="margin-top: 7px;">앗! 비밀번호를 잊으셨나요? <a class="find">비밀번호 찾기</a></p>
        </form>
        <form class="find-form" method="post">
          <input type="email" id="email_" name="email" placeholder="회원가입 시 사용했던 이메일" />

          <button type="button" id="pw-rset-btn">비밀번호 재설정</button>
          <p class="message"><a href="#" class="back-first">로그인으로 돌아가기</a></p>
        </form>
      </div>
	</div>
	<script>
		$('.message .back').click(function(){
		  $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
		  $(".find-form").hide();
        });
        $('.message .find').click(function(){
          $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
          $(".register-form").hide();
        });
        $('.message .back-first').click(function(){
          $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
          $(".register-form").hide();
        });
        
     	// 이메일 인증, 중복체크
        var code="";
        $('.mail-Check-Btn').click(function() {
    		const memberId = $('#email-2').val(); // 이메일 주소값 얻어오기!
    		const checkInput = $('#emailcheck'); // 인증번호 입력하는곳 
    		const $resultMsg = $('#mail-check-warn1');
    		
    		$.ajax({
    			type : 'get',
    			url : "mailCheck.me",
    			data: {
    				memberId:memberId
    			},
    			// GET방식이라 Url 뒤에 email을 뭍힐수있다.
    			success : function(data) {
    				if(data=='N') {
    					$resultMsg.css('margin-bottom', '20px');
    	    			$resultMsg.html('이미 탐나지 회원이신걸요~?');
    	    			$resultMsg.css('color','red');
    	    			$('#email-2').focus(function() {
							$resultMsg.html('');
						});
    				} else {
    					console.log("data : " + data);
        				checkInput.attr('disabled', false);
        				code = data;
    	    			$('#email-2').attr('readonly',true);
    	    			$('.mail-Check-Btn').attr('disabled',true);
    	    			Swal.fire({
    	    				   text: '인증번호를 전송했습니다!',
    	    				   icon: 'success',
    	    				   
    	    				   confirmButtonColor: '#80ca6a', // confrim 버튼 색깔 지정
    	    				   confirmButtonText: '확인', // confirm 버튼 텍스트 지정

    	    				});
    				}
    			}
    		}); // end ajax
    	}); // end send email
    	
    	// 인증번호 비교 
    	$('#emailcheck').blur(function () {
    		const inputCode = $(this).val();
    		const $resultMsg = $('#mail-check-warn2');
    		
    		if(inputCode === code){
    			$resultMsg.html('인증번호가 일치합니다.');
    			$resultMsg.css('color','green');
    			$resultMsg.css('marginBottom', '15px');
    			$('.mail-Check-Btn').attr('disabled',true);
    			$('#email-2').attr('readonly',true);
    			$('#emailcheck').focus(function(){
					$resultMsg.html('');
				});
    		} else {
    			$resultMsg.css('marginBottom', '15px');
    			$resultMsg.html('인증번호를 다시 확인해주세요!');
    			$resultMsg.css('color','red');
    		}
    	});
    	
    	// 비밀번호 확인
		$('#password-confirm').blur(function () {
			var password = document.getElementById('password');					// 비밀번호 
			var passwordConfirm = document.getElementById('password-confirm');	// 비밀번호 확인 값
			var confirmMsg = document.getElementById('pw-check-warn');			// 확인 메세지
			if(password.value == passwordConfirm.value && password.value != "" && passwordConfirm.value != "") {
				confirmMsg.style.color = "green";
				confirmMsg.style.marginBottom = "25px";
				confirmMsg.innerHTML = "비밀번호가 일치합니다.";
			} else if(password.value == "") {
				confirmMsg.style.color = "red";
				confirmMsg.style.marginBottom = "15px";
				confirmMsg.innerHTML = "비밀번호를 입력해주세요.";
    			$('#password').focus(function() {
					$resultMsg.html('');
				});
			} else {
				confirmMsg.style.color = "red";
				confirmMsg.style.marginBottom = "15px";
				confirmMsg.innerHTML = "비밀번호가 일치하지 않습니다.";
			}
		});
    	
		// 닉네임 중복 체크
       	$(function() {
    		
    		var $nameInput = $(".register-form input[name=nickname]");
    		
			$('.name-Check-Btn').click(function() {
    			
    			if($nameInput.val().trim().length >= 2) {
    		
					$.ajax({
	    				url : "nameCheck.me",
	    				data : {nickname : $nameInput.val()},
	    				success : function(result) {
	    						
							if(result == "N") { // 사용 불가능
	    							
	    						$("#nn-check-warn").show();
	    						$("#nn-check-warn").css("margin-bottom", "20px");

	    						$("#nn-check-warn").css("color", "red").text("중복된 닉네임이 존재합니다. 다시 입력해 주세요.");
	    						// 회원가입버튼 비활성
	    						$(".register-form button[type=submit]").attr("disabled", true);
	    					} else { // 사용 가능
	    						
	    						$("#nn-check-warn").show();
	    						$("#nn-check-warn").css("margin-bottom", "20px");
	    						$("#nn-check-warn").css("padding-top", "-20px");
	    						$("#nn-check-warn").css("color", "green").text("멋진 닉네임이네요!");

	    						$(".register-form button[type=submit]").attr("disabled", false);
	    					}
	    				},
	    				error : function() {
	    						
	    					console.log("닉네임 중복 체크용 ajax 통신 실패!");
	    				}
	    			});
	    		} else {
	    			
					$("#nn-check-warn").show();
					$("#nn-check-warn").css("color", "blue").text("닉네임을 2글자 이상 입력해 주세요.");
    				$(".register-form button[type=submit]").attr("disabled", true);
    			}
    		});
    	});
		
		// 생년월일 8자리
		$(function() {
			
			$('#birthday').keyup(function() {
			
		    	if($("#birthday").val().trim().length == 8) {
		    		
					$(".register-form button[type=submit]").attr("disabled", false);
		    	} else {
		    		
					$(".register-form button[type=submit]").attr("disabled", true);
    			}
		    });
		});
		
     	// 비밀번호 재설정
        var code="";
        $('#pw-rset-btn').click(function() {
    		const memberId = $('#email_').val();	// 이메일 주소값 얻어오기!
    		const $resultMsg = $('#mail-check-warn1');
    		
    		$.ajax({
    			type : 'post',
    			url : "mailPwd.me",
    			data: {
    				memberId:memberId
    			},
    			// GET방식이라 Url 뒤에 email을 뭍힐수있다.
    			success : function(data) {
    				if(data=='N') {
    					Swal.fire({
        	  				  text: '가입된 이메일이 아닙니다.',
        	  				  icon: 'error',
        	  				  confirmButtonColor: '#80ca6a', // confrim 버튼 색깔 지정
        	     				  confirmButtonText: '확인'
        	  				});
    				} else {
    					console.log(data);
        				code = data;
    	    			$('#email_').attr('readonly',true);
    	    			$('#pw-rset-btn').attr('disabled',true);
    	    			Swal.fire({
    	  				  text: '비밀번호가 전송되었습니다.',
    	  				  icon: 'success',
    	  				  confirmButtonColor: '#80ca6a', // confrim 버튼 색깔 지정
    	     				  confirmButtonText: '확인'
    	  				});
        				location.href='loginForm.me';
    				}
    			}
    		}); // end ajax
    	}); // end send pwd email
	</script>
	
	<script type="text/javascript">
  // <![CDATA[
  var colour="#58D3F7"; // in addition to "random" can be set to any valid colour eg "#0040FF" or "red"
  var sparkles=50;
  var x=ox=400;
  var y=oy=300;
  var swide=800;
  var shigh=600;
  var sleft=sdown=0;
  var tiny=new Array();
  var star=new Array();
  var starv=new Array();
  var starx=new Array();
  var stary=new Array();
  var tinyx=new Array();
  var tinyy=new Array();
  var tinyv=new Array();
  window.onload=function() { if (document.getElementById) {
    var i, rats, rlef, rdow;
    for (var i=0; i<sparkles; i++) {
      var rats=createDiv(3, 3);
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      document.body.appendChild(tiny[i]=rats);
      starv[i]=0;
      tinyv[i]=0;
      var rats=createDiv(5, 5);
      rats.style.backgroundColor="transparent";
      rats.style.visibility="hidden";
      rats.style.zIndex="999";
      var rlef=createDiv(1, 5);
      var rdow=createDiv(5, 1);
      rats.appendChild(rlef);
      rats.appendChild(rdow);
      rlef.style.top="2px";
      rlef.style.left="0px";
      rdow.style.top="0px";
      rdow.style.left="2px";
      document.body.appendChild(star[i]=rats);
    }
    set_width();
    sparkle();
  }}
  function sparkle() {
    var c;
    if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
      ox=x;
      oy=y;
      for (c=0; c<sparkles; c++) if (!starv[c]) {
        star[c].style.left=(starx[c]=x)+"px";
        star[c].style.top=(stary[c]=y+1)+"px";
        star[c].style.clip="rect(0px, 5px, 5px, 0px)";
        star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
        star[c].style.visibility="visible";
        starv[c]=50;
        break;
      }
    }
    for (c=0; c<sparkles; c++) {
      if (starv[c]) update_star(c);
      if (tinyv[c]) update_tiny(c);
    }
    setTimeout("sparkle()", 40);
  }
  function update_star(i) {
    if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
    if (starv[i]) {
      stary[i]+=1+Math.random()*3;
      starx[i]+=(i%5-2)/5;
      if (stary[i]<shigh+sdown) {
        star[i].style.top=stary[i]+"px";
        star[i].style.left=starx[i]+"px";
      }
      else {
        star[i].style.visibility="hidden";
        starv[i]=0;
        return;
      }
    }
    else {
      tinyv[i]=50;
      tiny[i].style.top=(tinyy[i]=stary[i])+"px";
      tiny[i].style.left=(tinyx[i]=starx[i])+"px";
      tiny[i].style.width="2px";
      tiny[i].style.height="2px";
      tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
      star[i].style.visibility="hidden";
      tiny[i].style.visibility="visible"
    }
  }
  function update_tiny(i) {
    if (--tinyv[i]==25) {
      tiny[i].style.width="1px";
      tiny[i].style.height="1px";
    }
    if (tinyv[i]) {
      tinyy[i]+=1+Math.random()*3;
      tinyx[i]+=(i%5-2)/5;
      if (tinyy[i]<shigh+sdown) {
        tiny[i].style.top=tinyy[i]+"px";
        tiny[i].style.left=tinyx[i]+"px";
      }
      else {
        tiny[i].style.visibility="hidden";
        tinyv[i]=0;
        return;
      }
    }
    else tiny[i].style.visibility="hidden";
  }
  document.onmousemove=mouse;
  function mouse(e) {
    if (e) {
      y=e.pageY;
      x=e.pageX;
    }
    else {
      set_scroll();
      y=event.y+sdown;
      x=event.x+sleft;
    }
  }
  window.onscroll=set_scroll;
  function set_scroll() {
    if (typeof(self.pageYOffset)=='number') {
      sdown=self.pageYOffset;
      sleft=self.pageXOffset;
    }
    else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
      sdown=document.body.scrollTop;
      sleft=document.body.scrollLeft;
    }
    else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
      sleft=document.documentElement.scrollLeft;
      sdown=document.documentElement.scrollTop;
    }
    else {
      sdown=0;
      sleft=0;
    }
  }
  window.onresize=set_width;
  function set_width() {
    var sw_min=999999;
    var sh_min=999999;
    if (document.documentElement && document.documentElement.clientWidth) {
      if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
      if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
    }
    if (typeof(self.innerWidth)=='number' && self.innerWidth) {
      if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
      if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
    }
    if (document.body.clientWidth) {
      if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
      if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
    }
    if (sw_min==999999 || sh_min==999999) {
      sw_min=800;
      sh_min=600;
    }
    swide=sw_min;
    shigh=sh_min;
  }
  function createDiv(height, width) {
    var div=document.createElement("div");
    div.style.position="absolute";
    div.style.height=height+"px";
    div.style.width=width+"px";
    div.style.overflow="hidden";
    return (div);
  }
  function newColour() {
    var c=new Array();
    c[0]=255;
    c[1]=Math.floor(Math.random()*256);
    c[2]=Math.floor(Math.random()*(256-c[1]/2));
    c.sort(function(){return (0.5 - Math.random());});
    return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
  }
  // ]]>
  </script>
</body>
</html>