<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(id.equals("hong")&&pwd.equals("1234")){
		//로그인 조건이 갖춰지면 로그인 결과 페이지로 가기 전에 로그인 정보를 세션에 저장합니다.
		session.setAttribute("loginUser",id);
		//차후에는 세션에 로그인 정보를 단순히 지금처럼 id만 저장하는게 아니라, 
		//로그인한 사람의 정보를 Dto 객체에 넣고 Dto 객체를 세션에 저장하게 됩니다.
		response.sendRedirect("073_main.jsp");
	} else {
		response.sendRedirect("071_LoginForm.jsp");
	}
%>