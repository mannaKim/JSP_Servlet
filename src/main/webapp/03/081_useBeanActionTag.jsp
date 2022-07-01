<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ezen.dto.MemberBean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>081_useBeanActionTag.jsp</title>
</head>
<body>
<%
	//1. jsp문법으로 객체를 생성하는 방법
	com.ezen.dto.MemberBean member1 = new com.ezen.dto.MemberBean(); //import 없이 객체 생성
	MemberBean member2 = new MemberBean(); //패키지 또는 클래스 import 후 생성
%>
	<!-- 2. 액션 태그를 이용한 객체 생성 -->
	<jsp:useBean id="member" class="com.ezen.dto.MemberBean"/>
	
	<h3>
	◎ java Bean 객체의 저장된 정보 출력하기<br>
	이름 : <%=member.getName() %><br>
	아이디 : <%=member.getUserid() %><br><br>
	
	◎ 정보를 변경한 후 변경된 정보 출력하기<br>
	<%
		member1.setName("홍길동");
		member1.setUserid("HongGilDong");
	%>
	이름 : <%=member1.getName() %><br>
	아이디 : <%=member1.getUserid() %><br><br>
	
	◎ 액션 태그로 정보 변경 후 변경된 정보 출력하기<br>
	<jsp:setProperty name="member" property="name" value="홍길서"/>
	<jsp:setProperty name="member" property="userid" value="HongGilSeo"/>
	이름 : <jsp:getProperty name="member" property="name"/><br>
	아이디 : <jsp:getProperty name="member" property="userid"/><br>
	<!-- jsp로 만든 객체는 액션태그로 Access되지 않습니다. -->
	</h3>
</body>
</html>