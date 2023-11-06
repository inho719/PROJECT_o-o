<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <script type="text/javascript">
 
		let result = '${N.mid}';
		if(result.length != 0){
			alert('성공');
			window.opener.location.href='/';
			window.close();
		}else{
			alert('회원가입 진행');
			console.log(result);
			$.ajax({
				type : 'get',
				url : 'memberJoin_naver',
// 				dataType: { "" ,  },
				success : function(joinResult){
					if(joinResult > 0){
					alert('네이버 계정으로 회원가입 되었습니다. \다시 로그인 해주세요');
					location.href="/LoginPage";						
					}else{
						alert('실패 다시 시도하세요');
					}
				}
			});
			window.close();
		}
		
  </script>
  </body>
</html>
