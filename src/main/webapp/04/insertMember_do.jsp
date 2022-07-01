<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	String sql = "insert into mem(id,name,pwd,phone) values(?,?,?,?)";
	
	String userid = request.getParameter("userid");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	String phone = request.getParameter("phone");
	
	//레코드 추가
	//try catch 구문을 JDBC에서 사용한 것 처럼 레코드를 추가해주세요
	try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,uid,pass);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, name);
			pstmt.setString(3, pwd);
			pstmt.setString(4, phone);
			
			pstmt.executeUpdate();
	} catch(Exception e) { e.printStackTrace(); 
	} finally {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	//되돌아감
	response.sendRedirect("MemberMGR.jsp");
%>