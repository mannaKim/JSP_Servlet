<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		td{text-align:center;}
	</style>
	<meta charset="UTF-8">
	<title>MemberMGR.jsp</title>
	<%! 
		//반드시 선언부에 쓸 필요는 없음
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		String uid = "scott";
		String pass = "tiger";
		
		String sql = "select * from mem";
	%>
</head>
<body>
	<!-- mem테이블의 레코드를 모두 읽어와서 화면에 레코드를 행별로 필드를 열에 맞춰서 표시합니다. -->
	<table width="800" border="1">
		<tr>
			<th>이름</th><th>아이디</th><th>암호</th>
			<th>전화번호</th><th>수정</th><th>삭제</th>
		</tr>
<%
	try{
		//테이블을 읽어오기 위해 데이터베이스에 연결
		Class.forName(driver);
		con=DriverManager.getConnection(url,uid,pass);
		
		pstmt = con.prepareStatement(sql); //sql과 con을 pstmt에 장착
		rs = pstmt.executeQuery();	//장착된 sql 실행 후 결과를 rs에 저장
		
		while(rs.next()) {
			out.println("<tr>");
				out.println("<td>"+rs.getString("name")+"</td>");
				out.println("<td>"+rs.getString("id")+"</td>");
				out.println("<td>"+rs.getString("pwd")+"</td>");
				out.println("<td>"+rs.getString("phone")+"</td>");
				out.println("<td><a href='updateForm.jsp?userid="
							+rs.getString("id")+"'>수정</a></td>");
				out.println("<td><a href='delete.jsp?userid="
							+rs.getString("id")+"'>삭제</a></td>");
				//필드 개수 만큼
			out.println("</tr>");
		}
	} catch(Exception e) { e.printStackTrace();	
	} finally {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
%>
	</table>
	<a href="insertForm.jsp">멤버 추가</a>
</body>
</html>