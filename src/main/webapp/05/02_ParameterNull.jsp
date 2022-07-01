<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_ParameterNull.jsp</title>
</head>
<body>
	<h3>JSP 코드 : <%=request.getParameter("id")%></h3>
	<h3>EL 코드 : ${param.id}</h3>
	
	<br>
	JSP 코드<br>
	<%--<%=request.getParameter("id").equals("hong")--%>
	request.getParameter("id").equals("hong") => 에러<br>
	equals 메소드 : 비교 주체가 null이면 에러<br>
	<br>
	에러를 방지하기 위해 아래와 같은 연산을 사용 : <br>
	request.getParameter("id")!=null && request.getParameter("id").equals("hong") => 
	<%=request.getParameter("id")!=null && request.getParameter("id").equals("hong")%>
	
	<hr>
	EL 식<br>
	'==' 연산자 사용 결과 : \${param.id=="hong"} => ${param.id=="hong"}
	
	<hr>
	equals()를 사용할 때 null값 비교 오류 해결 방법 : <br>
	<pre>  
	<!-- <pre> 태그 : 입력 한 그대로를 화면에 보여주라는 태그 : 주로 코딩 내역을 화면에 표시할때 사용. -->
		if( request.getParameter("id") != null ){
			if( request.getParameter("id").equals("hong") ){ 
			
			}
		}
	</pre>
</body>
</html>