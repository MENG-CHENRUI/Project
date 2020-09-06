package home.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.controller.LoginController;
import home.form.LoginForm;
import jdbc.ConnectionDemo;

public class Team1DispatchServlet extends HttpServlet {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		final String urlStr = request.getRequestURI();

		// LoginDemo 对比数据库中的用户名和密码，若成功则进入到主页
		if ("/team01/home".equals(urlStr)) { // **控制层代码

			final LoginController loginController = new LoginController();
			final LoginForm form = new LoginForm();
			final String login_username = request.getParameter("login_username");// ***业务逻辑层代码
			final String login_password = request.getParameter("login_password");// ***业务逻辑层代码
			form.setUsername(login_username);
			form.setPassword(login_password);
			final String resultPageId = loginController.login(form);

			request.getRequestDispatcher(resultPageId).forward(request, response);// **控制层代码

		}
		// SigninDemo 将用户输入的用户名和密码写入数据库
		if ("/team01/sign_in".equals(urlStr)) {// **控制层代码
			String signin_username;// ***业务逻辑层代码
			String signin_password;// ***业务逻辑层代码
			String signin_phonenumber;// ***业务逻辑层代码

			int exist_id = 0;// ***业务逻辑层代码
			signin_username = request.getParameter("signin_username");// ***业务逻辑层代码
			signin_password = request.getParameter("signin_password");// ***业务逻辑层代码
			signin_phonenumber = request.getParameter("signin_phonenumber");// ***业务逻辑层代码
			System.out.print(signin_username);// ***业务逻辑层代码
			System.out.print(signin_password);// ***业务逻辑层代码
			System.out.print(signin_phonenumber);// ***业务逻辑层代码

			// 如果输入的值为空，则提示错误并保持原界面
			if (signin_username == "" || signin_password == "" || signin_phonenumber == "") {// **控制层代码
				request.getRequestDispatcher("jsp/sign_in.jsp").forward(request, response);// **控制层代码
			} // **控制层代码

			// 创建一个连接到数据库
			final Connection conn = ConnectionDemo.getConnection();

			// 将用户的信息写入数据库
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.prepareStatement("select * from login order by id");
				rs = stmt.executeQuery();

				while (rs.next()) {
					exist_id = exist_id + 1;
				}
				if (signin_username != "" && signin_password != "" && signin_phonenumber != "") {
					final Statement stmt1 = conn.createStatement();
					stmt1.executeUpdate("insert into login(id,user_name,password,phone_number) " + "values('"
							+ (exist_id + 1) + "','" + signin_username + "','" + signin_password + "','"
							+ signin_phonenumber + "')");
				}
			} catch (final SQLException e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("login.jsp").forward(request, response);// **控制层代码
			return;
		}

		if ("/team01/log_out".equals(urlStr)) {// **控制层代码
			request.getRequestDispatcher("login.jsp").forward(request, response);// **控制层代码
		} // **控制层代码

	}
}
