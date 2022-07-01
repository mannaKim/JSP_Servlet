<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!-- JSP 문법에 의한 로그인 체크 동작만 필요한 페이지이므로 별도의 HTML 태그는 사용하지 않습니다. -->
<%
	//072_Login_do.jsp?id=xxxx&pwd=xxxx -> post방식에서는 ?id=xxxx&pwd=xxxx를 감춤
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//이 부분에서 실제로는 데이터베이스 엑세스 후 회원 목록을 조회하여 아이디와 비밀번호를 비교합니다.
	//지금은 특정 아이디("hong")와 비밀번호("1234")만 비교합니다.
	if(id.equals("hong")&&pwd.equals("1234")){
		//원하는 아이디와 비밀번호가 전달되어 왔는지 확인 후 맞으면
		//"073_loginOk.jsp"로 이동합니다.
		//JSP에서 페이지 이동 명령 : response.sendRedirect();
		response.sendRedirect("073_loginOk.jsp?name="+URLEncoder.encode("홍길동","UTF-8"));
		//input type="text" 태그를 쓰지 않고, 
		//이동하는 주소에 전달할 파라미터의 name과 value를 붙여서 전송이 가능합니다.
		//위와 같이 주소에 파라미터를 붙이는 방식은 post 방식으로는 사용할 수 없으므로 중요정보도 모두 노출됩니다.
		
		//jsp 파일에서 로그인 절차를 진행하면 한글 전달값에 대한 인코딩이 UTF-8이 아니기 때문에
		//도착페이지에서 표시되는 한글이 깨집니다. 이 때는 별도의 URLEncoder 객체를 사용해야 합니다.
	} else{
		response.sendRedirect("071_LoginForm.jsp");
	}
%>