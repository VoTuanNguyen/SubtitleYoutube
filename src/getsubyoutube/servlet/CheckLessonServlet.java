package getsubyoutube.servlet;

import getsubyoutube.conn.ConnectionUtils;
import getsubyoutube.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checksavelesson")
public class CheckLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckLessonServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String idvideo = request.getParameter("idvideo");
		
		System.out.print(email + "  " + idvideo);
		
		PrintWriter out = response.getWriter();
		
		try {
			Connection conn = ConnectionUtils.getConnection();
			Boolean isExist = DBUtils.checkExistLesson(conn, email, idvideo);
			if(isExist)
				out.print("ok");
			else
				out.print("fail");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
