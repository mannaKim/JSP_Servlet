<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_Action_to.jsp</title>
</head>
<body>
	<h3>get 방식으로 요청되어진 주소</h3>
	<p>http://localhost:8090/WEB07_JSP_SERVLET/01/03_Action_to.jsp?name=aaa&id=bbb&pwd=ccc&pwd_re=ddd</p>
	<!-- 03_Action_to.jsp는 최종 이동할 페이지 이름이며, 그 뒤 '?'이후의 내용은 name=value로 구성되어
	서버로 전송된 입력 데이터들입니다. post방식은 이들을 노출하지 않습니다. -->
	<!-- 주소 내에 포함된 value 중 한글은 인코딩 방식에 따라 %16진수 값으로 표시될 수 있습니다. -->
	<h3>post 방식으로 요청되어진 주소</h3>
	<p>http://localhost:8090/WEB07_JSP_SERVLET/01/03_Action_to.jsp</p> <hr>
	
	<!-- 아래는 서버에서 실행되어 HTML5로 구성될 내용들입니다. -->
	<%
		String name = request.getParameter("name"); //"name" : form 내부에 있던 입력란의 name값
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String pwd_re = request.getParameter("pwd_re");
		// getParameter로 받는 모든 데이터는 String 데이터로 받을 수 있습니다.
	%>
	<h3>
		성명 : <%=name %><br>
		아이디 : <%=id %><br>
		비밀번호 : <%=pwd %><br>
		비밀번호 확인 : <%=pwd_re %><br>
	</h3>
</body>
</html>