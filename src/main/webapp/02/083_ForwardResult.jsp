<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>083_ForwardResult.jsp</title>
</head>
<body>
	<%
		//첫 페이지에서 전송된 abc="가나다라" 라는 파라미터가 request에 아직 파라미터로 담겨있습니다.
		//이전 페이지에서 그 request가 그대로 전송되어 왔기 때문에 현재 페이지에서도 사용이 가능합니다.
		String age = request.getParameter("age");
		String abc = request.getParameter("abc"); //첫 페이지 히든으로 포함된 파라미터
		
		String name = (String)request.getAttribute("name"); //Attribute에 저장된 전송자료
		//Attribute에 저장형식은 모든 클래스의 부모클래스인 Object 형태로 저장되므로,
		//다시 값을 추출할 때 강제 캐스팅이 필요합니다.
	%>
	<h1>forward 방식으로 이동된 페이지</h1>
	<h1>나이 : <%=age%></h1>
	<h1>이름 : <%=name%></h1>
	<h1>전송자료 : <%=abc%></h1>
</body>
</html>