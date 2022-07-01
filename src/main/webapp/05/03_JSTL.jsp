<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
prefix="c" : JSTL 문법을 사용하기 위해서  태그의 첫글자를 c 를 사용하겠습니다라는 표시
c: 으로 시작하는 "태그"는 jstl문법이 적용 됩니다.
-->
<%-- JSTL 사용 방법 : <c:태그이름></c:태그이름> 또는 <c:태그이름/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_JSTL.jsp</title>
</head>
<body>
	<!-- EL에 없는 JSP 기능 대부분이 JSTL에서 제공됩니다. 변수, 반복문 if 등 -->
	<h3>
		◎ 단순 출력<br>
		JSTL 출력 : <c:out value="Hello"/><br>
		EL 출력 : ${"Hello"}
	</h3><br>
	
	<h3>
		◎ 변수 생성 및 초기화 1<br>
		<c:set var="msg" value="Hello"></c:set>
		생성한 변수를 EL에 의해 출력 \${msg} = ${msg}
		<br><br>
		◎ 변수 생성 및 초기화 2<br>
		<c:set var="age">30</c:set>
		생성한 변수를 EL에 의해 출력 \${age} = ${age}
	</h3><br>
	
	<h3>
		◎ 객체 생성<br>
		<c:set var="member" value="<%=new com.ezen.dto.MemberBean()%>"></c:set>
		<!-- MemberBean member = new MemberBean(); -->
		<!-- 멤버변수 값 변경 -->
		<c:set target="${member}" property="name" value="홍길동"/>
		<c:set target="${member}" property="userid">Hong</c:set>
		EL에 의한 멤버변수 출력 - 객체와 멤버변수 이름만으로 setter기능이 대체됩니다.<br>
		\${member.name} = ${member.name}<br>
		\${member.userid} = ${member.userid}<br>
		클래스에 각 멤버변수에 대한 getter와 setter가 존재해야 위 실행이 가능합니다.<br>
		
		<%
			// JSP로 사용한 예
			com.ezen.dto.MemberBean mem = new com.ezen.dto.MemberBean();
			mem.setName("홍길동");
			mem.setUserid("Hong");
			out.println(mem.getName());
			out.println(mem.getUserid());
		%>
	</h3><br>
	
	<h3>
		◎ 그 외 변수와 출력 기능 - JSTL과 EL의 혼합 사용<br>
		<c:set var="add" value="${10 + 5}"></c:set>
		\${add} = ${add}<br>
		<c:set var="flag" value="${10 > 5}"></c:set>
		\${flag} = ${flag}<br>
		
		<br>
		◎ input 태그에 EL로 값 설정 => 
		<input type="text" value="${member.userid}">
	</h3>
	
</body>
</html>