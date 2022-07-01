<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String driver = "oracle.jdbc.OracleDriver";
	String uid = "scott";
	String pass = "tiger";
	
	String sql = "update mem set id=?,name=?,pwd=?,phone=? where id=?";
	
	String userid = request.getParameter("userid"); //updateForm에서 수정되었을 수 있는 id
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String updateid = request.getParameter("updateid"); //hidden으로 전송된 원래 id (조건으로 쓰임)
	
	try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,uid,pass);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, pwd);
			pstmt.setString(4, phone);
			pstmt.setString(5, updateid);
			pstmt.executeUpdate();
	} catch(Exception e) { e.printStackTrace(); 
	} finally {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
	response.sendRedirect("MemberMGR.jsp");
%>