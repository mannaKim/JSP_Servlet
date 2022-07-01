<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>122_ParameterTo.jsp</title>
</head>
<body>
	<h3>당신이 입력한 정보입니다(고전적인 방식).</h3><hr>
	아이디 : <%= request.getParameter("id")%> <br>
	비밀번호 : <%= request.getParameter("pwd")%> <br><br>
	
	<br><br>
	<h3>당신이 입력한 정보입니다(EL 방식).</h3><hr>
	아이디 : ${param.id} <br>
	비밀번호 : ${param["pwd"]}
</body>
</html>