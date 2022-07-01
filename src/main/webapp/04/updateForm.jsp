<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateForm.jsp</title>
	<%! 
		//반드시 선언부에 쓸 필요는 없음
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.OracleDriver";
		
		String sql = "select * from mem where id=?";
	%>
</head>
<body>
	<%
		String userid = request.getParameter("userid");
		String name = null;
		String phone = null;
	
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,"scott","tiger");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				name=rs.getString("name");
				phone=rs.getString("phone");
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
	<h2>회원의 정보 수정 폼</h2>
	<form method="post" action="updateMember_do.jsp">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" size="20" value="<%=name%>"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" size="20" value="<%=userid%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" size="20"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" size="20" value="<%=phone%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="정보수정"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
			<!-- where절에서 조건으로 구분할 아이디를 hidden으로 따로 받기 -->
			<input type="hidden" name="updateid" value="<%=userid%>">
		</table>
	</form>
</body>
</html>