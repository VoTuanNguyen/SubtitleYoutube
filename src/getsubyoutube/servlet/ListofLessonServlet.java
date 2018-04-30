package getsubyoutube.servlet;

import getsubyoutube.conn.ConnectionUtils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import getsubyoutube.beans.Lesson;
import getsubyoutube.utils.DBUtils;

@WebServlet("/listlesson")
public class ListofLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListofLessonServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		PrintWriter out = response.getWriter();
		try {
			Connection conn = ConnectionUtils.getConnection();
			ArrayList<Lesson> lst = new ArrayList<Lesson>();
			lst = DBUtils.getLesson(conn, email);
			if (lst.size() > 0) {
				for (Lesson ls : lst) {
					out.print("<div class=\"col-md-3 col-sm-3\" style=\"margin-bottom: 20px;\">");
					out.print("<img src=\""
							+ ls.getLinkimg()
							+ "\" style=\"height: 400px; width: 300px\" class=\"thumbnail\">");
					out.print("<center><h4 class=\"title\" style=\"height: 35px\">"
							+ ls.getTitle() + "</h4></center>");
					out.print("<div class=\"row\">");
					out.print("<div class=\"col-sm-6\"><a href=\"getsub?v="
							+ ls.getIdvideo()
							+ "\" class=\"btn btn-primary btn-block\">View Video</a></div>");
					out.print("<div class=\"col-sm-6\"><a id=\""
							+ ls.getIdvideo()
							+ "\" class=\"btn btn-danger btn-block\">Delete</a></div>");
					out.print("</div>");
					out.print("</div>");
					out.print("<script>");
					out.print("$(\"#" + ls.getIdvideo() + "\").click(function(){"
							+ " var les = {"
							+ " email : '"+email+"',"
							+ " idvideo : '"+ls.getIdvideo()+"'"
							+ " };"
							+ " $.post(\"DeleteLesson\", les).done(function(text) {"
							+ " if (text == \"fail\") {"
							+ " alert('Delete fail! Please try again!');"
							+ " } else {"
							+ " $.post(\"listlesson\", les).done(function(text) {"
							+ " if (text == \"\") {"
							+ " alert('Try again!');"
							+ " } else {"
							+ " $('#listlesson').html(text);"
							+ " }"
							+ " });"
							+ " }"
							+ " });"
							+ "});");
					out.print("</script>");
				}
			} else {
				out.print("<div class=\"row\" style=\"text-align: center\"><h3>List of lesson is empty! Please add lesson and come back later!</h3></div>");
			}
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

}
