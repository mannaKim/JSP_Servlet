<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 페이지(파일)는 JSP문법에 의한 검증 처리만 필요한 페이지이므로 HTML코드는 사용하지 않습니다.
	String sAge = request.getParameter("age");
	int age = Integer.parseInt(sAge);
	//== int age = Integer.parseInt(request.getParameter("age"));

	if(age <= 19){
%>
		<script type="text/javascript">
			alert("20세 미만은 입장이 불가능합니다.");
			//location.href = "081_ForwardForm.jsp";
			history.go(-1); //뒤로 버튼을 클릭한 것과 같습니다.
		</script>
<%		
	} else{
		//request 객체에는 Attribute라는 저장소(HashMap 형식과 비슷한 멤버변수)가 있습니다.
		//Attribute에 전달할 데이터의 자료이름과 값을 같이 저장하고,
		//forward(이동)하면 목적지에 해당 데이터가 같이 이동합니다.
		
		//Attribute라는 저장소에 name이라는 이름으로 "홍길동"이란 값을 저장해두고
		//083_ForwardResult.jsp로 이동(forward)합니다.
		//이 때 현재 페이지에 존재하면서 보내고자하는 내용을 저장한 request와 response도 같이 이동합니다.
		//083_ForwardResult.jsp에서는 이전 페이지에서 보내준 request와 response를 이용해서
		//저장해둔 name값을 꺼내 사용할 수 있습니다.
		//저장 메서드 : setAttribute()
		//추출 메서드 : getAttribute()
		
		//파라미터 저장
		request.setAttribute("name","홍길동");
		
		//RequestDispatcher(Forward 객체)
		//: 전송하려는 값을 갖고 있는 request를 가지고 원하는 페이지로 이동하는 객체
		
		//포워드를 위한 객체 생성 및 이동 페이지 설정
		RequestDispatcher dp = request.getRequestDispatcher("083_ForwardResult.jsp");
		
		//현재의 request와 response를 갖고 목적지로 이동
		dp.forward(request,response);
		
		//현재 페이지의 request객체의 수명은 forward로 전달될 다음 페이지까지 입니다.
		//보통 파라미터를 통해서 정보를 전달하고 request.getParameter()를 사용해서 전달된 값을
		//추출하여 사용하지만, 위의 RequestDispatcher는 전달인수대신 request 내부의
		//Attribute를 사용하여 전달인자를 저장하고, 그냥 놔두면 수명을 다해 없어질 현재 페이지의
		//request와 response를 함께 forward라는 명령으로 페이지를 이동하게 합니다.
		//이동한 페이지에서 Attribute를 사용하게 합니다.
		
		//forward 방식으로 이동된 페이지는 한글에 대한 인코딩 작업이 필요가 없습니다.
	}
%>
