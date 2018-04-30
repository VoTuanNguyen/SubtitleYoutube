package getsubyoutube.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import getsubyoutube.beans.UserAccount;
import getsubyoutube.utils.DBUtils;
import getsubyoutube.utils.MyUtils;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");

		UserAccount user = null;
		boolean hasError = false;
		String errorString = null;

		if (email == null) {
			hasError = true;
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {

				user = DBUtils.findUser(conn, email);

				if (user == null) {
					user = new UserAccount(email);
					DBUtils.insertUser(conn, user);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}

		if (hasError == false) {
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);
			MyUtils.storeUserCookie(response, user);
		}

	}

}