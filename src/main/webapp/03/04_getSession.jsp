<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_getSession.jsp</title>
</head>
<body>
	<h3>세션에 저장된 값을 하나씩 추출</h3>
	<%
		String id = (String)session.getAttribute("id");
		String pwd = (String)session.getAttribute("pwd");
		Integer age = (Integer)session.getAttribute("age");
		//Attribute에 저장되었던 모든 자료는 getAttribute로 꺼냈을 때 Object형이므로,
		//원래의 자료형으로 사용하기 위해서는 (자료형) 같은 강제 형변환이 필요합니다.
	%>
	id : <%=id %><br>
	pwd : <%=pwd %><br>
	age : <%=age %><br>
	
	<h3>세션에 설정된 모든 값 얻어오기</h3>
	<%
		java.util.Enumeration<String> names = session.getAttributeNames();
		//세션에 저장된 키값들만 얻어서 저장합니다.
		
		//다음 데이터가 없을 때 까지 반복하면서 다음 데이터를 키값으로 사용
		while(names.hasMoreElements()){
			//nextElement를 String형 변수에 저장
			String name = names.nextElement().toString(); //(String)형변환을 이용하지 않고 메서드를 사용
			//얻어낸 키(name)값으로 세션에서 getAttribute로 value값을 추출
			String value = session.getAttribute(name).toString();
			out.println(name + " : " + value + "<br>");
		}
	%>
</body>
</html>