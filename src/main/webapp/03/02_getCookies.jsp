<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_getCookies.jsp</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies(); 
		//getCookies() : 쿠키 내용을 한번에 다 얻어오는 명령 - 쿠키 객체 배열로 얻어옵니다.
		
		for(Cookie c : cookies) {
			out.println("<h2>"+c.getName()+" : "+c.getValue()+"</h2>");
		}
	%>
</body>
</html>