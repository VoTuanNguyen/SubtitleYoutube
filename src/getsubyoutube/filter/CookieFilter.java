package getsubyoutube.filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import getsubyoutube.beans.UserAccount;
import getsubyoutube.utils.DBUtils;
import getsubyoutube.utils.MyUtils;

@WebFilter(filterName = "cookieFilter", urlPatterns = { "/runCookie" })
public class CookieFilter implements Filter {

	public CookieFilter() {

	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		System.out.println("Cookie Filter");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		UserAccount userInSession = MyUtils.getLoginedUser(session);

		if (userInSession != null) {
			session.setAttribute("COOKIE_CHECKED", "CHECKED");
			chain.doFilter(request, response);
			return;
		}

		Connection conn = MyUtils.getStoredConnection(request);

		String checked = (String) session.getAttribute("COOKIE_CHECKED");
		if (checked == null && conn != null) {
			String Email = MyUtils.getUserNameInCookie(req);
			try {
				UserAccount user = DBUtils.findUser(conn, Email);
				MyUtils.storeLoginedUser(session, user);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			session.setAttribute("COOKIE_CHECKED", "CHECKED");
		}

		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
