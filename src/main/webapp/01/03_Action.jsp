<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_Action.jsp</title>
</head>
<body>
	<!-- 웹페이지, 웹프로그래밍에서는 회원가입,로그인,게시판 게시글 작성 등의 내용을 하나의 작업단위로 하여,
	작업당 하나의 form에 할당하여 운영합니다. 여기서 작업이란 클릭 한번에 처리될 수 있는 작업들을 말합니다.
	form의 첫번째 기능은 그 작업의 경계선을 제공하는 것이라고 할 수 있습니다. -->
	
	<form name="joinForm" action="03_Action_to.jsp" method="post">
	<!-- 
	name : 스크립트에서 다른것들과 구분하여 명명하기 위한 이름으로 사용
		(id가 css에서 구분하기 위한 이름이었다면, name은 주로 DOM에서 구분하기 위한 이름이라 보면 됨)
	action : 입력란 선택란에 입력하고 선택한 내용이 전달될 대상 파일
	method : 전달 방식을 의미하며, get은 일반 전송 방식, post는 비공개 전달 방식 사용
	-->
		<label for="name">이름</label><span style="color:red;">*</span>
		<input type="text" id="name" name="name" value=""> <br>
		<label for="id">아이디</label><span style="color:red;">*</span>
		<input type="text" id="id" name="id" value=""> <br>
		<label for="pwd">비밀번호</label><span style="color:red;">*</span>
		<input type="password" id="pwd" name="pwd" value=""> <br>
		<label for="pwd_re">비밀번호 확인</label><span style="color:red;">*</span>
		<input type="password" id="pwd_re" name="pwd_re" value=""> <br>
		<input type="submit" value="회원가입">
		<input type="reset" value="다시작성">
	</form>
</body>
</html>