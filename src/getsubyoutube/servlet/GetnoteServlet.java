package getsubyoutube.servlet;

import getsubyoutube.beans.Subnote;
import getsubyoutube.conn.ConnectionUtils;
import getsubyoutube.utils.DBUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/getnote")
public class GetnoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetnoteServlet() {
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
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String idvideo = request.getParameter("idvideo");
		PrintWriter out = response.getWriter();
		
		try {
			Connection conn = ConnectionUtils.getConnection();
			ArrayList<Subnote> lst = DBUtils.getNote(conn, email, idvideo);
			
			StringBuilder sb = new StringBuilder();
			sb.append("[");
			Gson gson = new Gson();
			int i=0;
			int len = lst.size();
			for(Subnote note : lst){
				i++;
				if(i<len){
					sb.append(gson.toJson(note)+",");
				}else{
					sb.append(gson.toJson(note));
				}
			}
			sb.append("]");
			out.print(sb.toString());// trả về chuỗi có dạng json
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
