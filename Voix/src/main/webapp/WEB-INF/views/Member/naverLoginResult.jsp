<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>네이버로그인</title>
</head>
<body>
<c:if test="${msg != null }">
	<script type="text/javascript">
    		alert('${msg}');
   	</script>
</c:if>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
	<script type="text/javascript">
		let result = '${N.mid}';
		if (result.length != 0) {
			alert('성공');
			window.opener.location.href = '/';
			window.close();
		} else {
			location.href = '/memberJoin_naver';
		}

		window.close();}
	</script>
</body>
</html>
