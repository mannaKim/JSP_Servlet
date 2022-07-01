<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>071_LoginForm.jsp</title>
</head>
<body>
	<!-- 로그인 폼 제작시 action란에는 서블릿과 (데이터베이스를 이용한 로그인을 할때는) 서블릿 이름을 써서
	이동하게합니다. -->
	<!-- 다만 지금은 아직 데이터베이스와 연동이 미진행되어 있으므로 약식 로그인 폼과 동작만 제작합니다. -->
	<form method="post" action="072_Login_do.jsp">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id"><br>
		<label for="pwd">암 &nbsp; 호 : </label>
		<input type="password" id="pwd" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>
	<!-- 
	1. 로그인폼에 아이디와 패스워드 입력 후 로그인버튼(submit) 클릭 
	2. action으로 지정된 페이지에 가서 아이디와 패스워드를 검증
	   (유효한 아이디, 그 아이디에 맞는 정확한 패스워드인지)
	3. 검증을 마친 결과(로그인성공/아이디없음/패스워드가틀림)를 갖고 결과 페이지로 이동
	4. 아이디와 패스워드 검증은 보통 서버내부에서 실행되는 JAVA 프로그래밍으로 이루어집니다.
	   (별도의 JAVA 클래스 생성)
	5. 그 자바프로그램의 시작을 서블릿이라고 하며, 외부에는 노출되지 않습니다.
	6. 아직 그 부분까지 학습하기 전이기 때문에 현재는 072_Login_do.jsp 파일 안에서 그 작업을 실행합니다.
	   (코드 외부 노출 가능)
	-->
</body>
</html>