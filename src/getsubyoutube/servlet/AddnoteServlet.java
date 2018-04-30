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

@WebServlet("/addnote")
public class AddnoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddnoteServlet() {
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
		String pos = request.getParameter("pos");
		String content = request.getParameter("content");
		String email = request.getParameter("email");
		String idvideo = request.getParameter("idvideo");
		
		PrintWriter out = response.getWriter();
		
		try {
			Connection conn = ConnectionUtils.getConnection();
			Boolean isExist = DBUtils.checkExistNote(conn, email, idvideo, pos);
			if(isExist){
				System.out.print("Đã tồn tại!");
				if(DBUtils.updateNote(conn, email, idvideo, content, pos))
					out.print("ok");
				else
					out.print("fail");
			}else{
				if(DBUtils.insertNote(conn, email, idvideo, content, pos))
					out.print("ok");
				else
					out.print("fail");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
