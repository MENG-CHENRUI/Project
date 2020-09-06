package home.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import home.form.LoginForm;
import home.result.ServiceResult;
import jdbc.ConnectionDemo;

// POJO
public class LoginServiceImpl implements Service {

	@Override
	public ServiceResult execute(LoginForm form) {
		final Connection conn = ConnectionDemo.getConnection();// ***业务逻辑层代码

		PreparedStatement stmt = null;// **持久层代码
		ResultSet rs = null;// **持久层代码
		final ServiceResult serviceResult = new ServiceResult();
		boolean hasUserInfo = false;
		try {// **持久层代码
			stmt = conn.prepareStatement("select password from login where username=?");// **持久层代码
// id =form.getUsername;
			rs = stmt.executeQuery();// **持久层代码
			while (rs.next()) {// **持久层代码
				if (rs.getString(1).contentEquals(form.getPassword())) {// **持久层代码
					hasUserInfo = true;
				}
			}
			if (hasUserInfo) {
				serviceResult.setStatus("success");
				serviceResult.setPageId("/jsp/home.jsp");
			} else {
				serviceResult.setStatus("false");
				serviceResult.setPageId("/jsp/login.jsp");
			}

		} catch (final SQLException e) {
			e.printStackTrace();
		}

		return serviceResult;

	}

}
