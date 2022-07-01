<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.OracleDriver";
	String uid = "scott";
	String pass = "tiger";
	
	String sql = "delete from mem where id=?";
	
	String userid = request.getParameter("userid"); 
	
	try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,uid,pass);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
	} catch(Exception e) { e.printStackTrace(); 
	} finally {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
%>
<script type="text/javascript">
	alert("삭제 되었습니다.");
	location.href = "MemberMGR.jsp";
</script>