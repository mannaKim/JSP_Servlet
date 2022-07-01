<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>073_main.jsp</title>
</head>
<body>
	<%
		if(session.getAttribute("loginUser")==null)
			response.sendRedirect("071_LoginForm.jsp");
		else {
	%>
			로그인 관리자<br>전화번호 010-1234-5678<br>
			<h2><%=session.getAttribute("loginUser")%>님이 로그인 하셨습니다.</h2>
			저희 사이트에 방문해 주셔서 감사합니다.<br> 즐거운 시간 되세요^^.<br>
			
			<form method="get" action="075_myPage_do.jsp">
				<input type="submit" value="마이페이지">
			</form>
			<form method="get" action="074_logout_do.jsp">
				<input type="submit" value="로그아웃">
				<!-- 074_logout_do.jsp에서 로그인 정보에 해당하는 세션값을 지우고
				새로운 로그인 창으로 이동하게 코딩 -->
			</form>
	<%
		}
	%>
</body>
</html>