<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>076_myPage.jsp</title>
</head>
<body>
<%
	if(session.getAttribute("loginUser")==null){
		response.sendRedirect("061_loginForm.jsp");
	}else{
%>
		아이디 : <%=session.getAttribute("loginUser")%><br>
		성명 : 홍길동<br>
		주소 : 서울특별시 마포구...<br>
		전화번호 : 010-XXXX-XXXX<br>
		주민등록번호 : XXXXXX-XXXXXXX<br>
		<input type="button" value="정보수정">
<%
	}
%>
</body>
</html>