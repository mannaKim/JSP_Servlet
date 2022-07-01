<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션 항목 한 개 삭제
	// session.removeAttribute("저장된 세션의 name값");
	session.removeAttribute("loginUser");
	
	//현재 사이트의 모든 세션을 삭제
	//session.invalidate();
	
	//response.sendRedirect("071_LoginForm.jsp");
%>
<script type="text/javascript">
	alert("로그아웃 되었습니다.");
	location.href = "MemberMGR.jsp";
</script>