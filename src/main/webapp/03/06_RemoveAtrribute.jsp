<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_RemoveAtrribute.jsp</title>
</head>
<body>
	<%
		session.setAttribute("s_name1","첫번째 값");
		session.setAttribute("s_name2","두번째 값");
		session.setAttribute("s_name3","세번째 값");
		
		out.print(" <h3> >> 세션값을 삭제하기 전 << </h3> ");
		java.util.Enumeration names = session.getAttributeNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement().toString();
			String value = session.getAttribute(name).toString();
			out.println(name + " : " + value + "<br>");
		}
		
		session.removeAttribute("s_name2"); //이름을 지정하여 세션에 저장된 객체를 제거합니다.
		out.print("<hr> <h3> >>세션값을 삭제한 후<< </h3> ");
		names = session.getAttributeNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement().toString();
			String value = session.getAttribute(name).toString();
			out.println(name + " : " + value + "<br>");
		}
	%>
</body>
</html>