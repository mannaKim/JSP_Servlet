<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_Calendar.jsp</title>
<style type="text/css">
	td{font-weight:bold; font-size:110%;}
	tr>td:first-child{color:red;}
	tr>td:last-child{color:blue;}
	a{text-decoration:none;}
</style>
</head>
<body>
	<% 
		Calendar sDay = Calendar.getInstance(); // startDay : 출력될 달력의 1일자를 저장할 객체
		Calendar eDay = Calendar.getInstance();	// endDay : 출력될 달력의 말일자를 저장할 객체
		
		int sYear = sDay.get(Calendar.YEAR);   // 오늘날짜의 연도
		int sMonth = sDay.get(Calendar.MONTH);  // 오늘 날짜의 월(0~11)
		
		//오늘 날짜로 sYear과 sMonth변수를 설정했다가, 만약 전달되는 파라미터가 존재한다면 그 값으로 변경
		if (request.getParameter("sYear")!=null)
			sYear = Integer.parseInt(request.getParameter("sYear"));
		if (request.getParameter("sMonth")!=null) {
			sMonth = Integer.parseInt(request.getParameter("sMonth"));
			if(sMonth==12){
				sMonth=0;
				sYear++;
			}
			if(sMonth==-1){
				sMonth=11;
				sYear--;
			}
		}
		// request : 웹페이지에 별도로 만들지 않아도 존재하는, 서버에 자료를 요청하기위한 객체 
		sDay.set(sYear, sMonth, 1); //출력할 월의 1일자로 설정
		eDay.set(sYear, sMonth+1, 1); // 다음달 의 1일로 설정
		eDay.add(Calendar.DATE, -1); // 다음달 1일에서 1일을 감소 -> 이달의 마지막 날짜
		
		//출력하려는 월의 1일자가 무슨 요일인지 정수값으로 계산    1:일요일, 2:월요일...
		int START_WEEK = sDay.get(Calendar.DAY_OF_WEEK);
		int i, k, cnt=0; //i는 반복실행에서 사용, k는 날짜 출력에 사용, cnt는 줄바꿈에 사용
	%>
	<table width="560" align="left" cellspacing="1" bgcolor="black">
		<tr bgcolor="white" height="50">
			<td align="center" colspan="7" style="font-size=150%;">
				<a href="07_Calendar.jsp?sYear=<%=sYear%>&sMonth=<%=sMonth-1%>">이전달</a>
				&nbsp;&nbsp;&nbsp;
				<%=sYear %>년 <%=sMonth+1 %>월
				&nbsp;&nbsp;&nbsp;
				<a href="07_Calendar.jsp?sYear=<%=sYear%>&sMonth=<%=sMonth+1%>">다음달</a>
			</td>
		</tr>	
		<tr bgcolor="white" height="50">
			<td align="center" width="80">일</td>
			<td align="center" width="80">월</td>
			<td align="center" width="80">화</td>
			<td align="center" width="80">수</td>
			<td align="center" width="80">목</td>
			<td align="center" width="80">금</td>
			<td align="center" width="80">토</td>
		</tr>
		<tr bgcolor="white" height="60">
			<% 
				for(i=1; i<START_WEEK; i++){ 
			%>
					<td>&nbsp;</td><!-- 첫칸부터 시작날짜의 요일바로 전열까지 빈칸 표시 -->
			<%
				} 
			%>
			<% 
				for(i=1; i<=8-START_WEEK; i++){ 
			%>
					<td align="right"><%=i%>&nbsp;</td>
			<%
				} 
			%>
		</tr>
		
		<tr  bgcolor="white" height="60">
			<%
				for(k=i; k<=eDay.get(Calendar.DATE); k++) {
			%>
					<td align="right"><%=k%>&nbsp;</td> <!-- 날짜출력 -->
			<%		
					cnt++; //날짜한번 표시하고 cnt 증가
					if(cnt%7 == 0){ 
			%>
					</tr><tr  bgcolor="white" height="60">
			<%
					}
				} 
				for(i=1; i<=7-(cnt%7); i++){
			%>
					<td>&nbsp;</td>
			<%
				}
			%>
		</tr>
	</table>
</body>
</html>