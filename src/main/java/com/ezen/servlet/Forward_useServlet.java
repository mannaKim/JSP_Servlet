package com.ezen.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Forward_useServlet
 */
@WebServlet("/Forward_useServlet")
public class Forward_useServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forward_useServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form에서 get방식으로 서블릿으로 이동되었을 때 실행될 명령이 적힙니다.
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form에서 post방식으로 서블릿으로 이동되었을 때 실행될 명령이 적힙니다.
		
		//doGet(request, response); 
		//서블릿을 호출할 때 방식이 post이든 get이든 실행할 명령이 똑같다면
		//doGet에 코드를 쓰고, doPost에서는 doGet을 호출해서 사용합니다.
		
		//전달된 파라미터에 한글이 있다면, 또는 내보내질 데이터에 한글이 있다면 인코딩 방식을 아래와 같이 설정
		request.setCharacterEncoding("UTF-8");	
		response.setCharacterEncoding("UTF-8");
		
		//전달된 파라미터를 변수에 저장
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		if(id.equals("hong")&&pwd.equals("1234")) {
			request.setAttribute("name", "홍길동");
			RequestDispatcher dp = request.getRequestDispatcher("02/102_Forward_UseServlet_ok.jsp");
			dp.forward(request, response);
		} else {
			response.sendRedirect("02/101_Forward_UseServlet.jsp");
		}
	}

}
