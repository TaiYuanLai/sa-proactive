package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		req.getSession().invalidate();

		Cookie loginCookie = null;
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("memberAccount")) {
					loginCookie = cookie;
					break;
				}
			}
		}

		if (loginCookie != null) {
			loginCookie.setMaxAge(0);
			resp.addCookie(loginCookie);
		}

		resp.sendRedirect("index.jsp");

	}
}
