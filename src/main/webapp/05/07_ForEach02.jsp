<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_ForEach02.jsp</title>
</head>
<body>
	<%
		String [] movieList = {"타이타닉", "시네마 천국", "혹성 탈출", "킹콩"};
		request.setAttribute("mList",movieList);
	%>
	<table border="1" style="width:700px;text-align:center">
		<tr>
			<th>index</th><th>count</th><th>title</th>
		</tr>
		<c:forEach items="${mList}" var="movie" varStatus="status">
			<tr>
				<td>${status.index}</td><td>${status.count}</td><td>${movie}</td>	
			</tr>
		</c:forEach>
	</table>
	<!-- 
	varStatus : 반복실행의 상태값을 갖고 있는 클래스
	status : 현재 반복순서 객체 변수
	${status.index} : 1부터 시작한 반복의 현재 아이템
	${status.count} : 0부터 시작한 반복의 현재 아이템
	${status.current} : 현재 아이템
	${status.begin} : 시작값
	${status.end} : 끝값
	${status.step} : 증가값
	-->
	 
	 
	<!-- 위의 request에 저장된 mList를 이용하여 반복실행문을 제작하되, 영화 제목으로
	구성된 리스트를 만들어주세요. choose when otherwise를 이용하여 첫번째 목록은 글자를 빨간색으로,
	나머지는 검은색으로 표시해주세요. 사용할 조건문 : test="${status.first}"-->
	<ul>
		<c:forEach var="movie" items="${mList}" varStatus="status">
			<c:choose>
				<c:when test="${status.first}">
					<li style="font-weight:bold;color:red;">${movie}</li>
				</c:when>
				<c:otherwise>
					<li>${movie}</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</ul>
	<!-- 
	${status.first} : 현재 루프가 처음이면 true 리턴
	${status.last} : 현재 루프가 마지막이면 true 리턴
	-->
	 
	<!-- 마지막 아이템만 빼고 각 아이템 사이에 컴마(,)를 찍어 출력하고 싶을 때 -->
	<h2>
		<c:forEach var="movie" items="${mList}" varStatus="status">
				${status.count} : ${status.current}
				<c:if test="${not status.last}">, </c:if>
		</c:forEach>
	</h2>
	
	<hr>
	<h3>반복 실행문의 또다른 사용 예 - begin과 end</h3>
	<c:forEach var="cnt" begin="1" end="10" varStatus="status">
		${cnt} <c:if test="${not status.last}">, </c:if>
	</c:forEach>
	
	<br><br>
	<table border="1" style="width:50%; text-align:center;" align="left">
		<tr>
			<th>index</th><th>count</th><th>cnt</th>
		</tr>
		<c:forEach begin="7" end="10" var="cnt" varStatus="status">
			<tr>
				<td>${status.index}</td><td>${status.count}</td><td>${cnt}</td>	
			</tr>
		</c:forEach>
	</table>
</body>
</html>