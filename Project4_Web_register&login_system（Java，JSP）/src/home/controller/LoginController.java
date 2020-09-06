package home.controller;

import home.form.LoginForm;
import home.result.ServiceResult;
import home.service.LoginServiceImpl;
import home.service.Service;

//POJO
public class LoginController {

	public String login(LoginForm form) {
		ServiceResult result;
		final Service loginService = new LoginServiceImpl();
		result = loginService.execute(form);
		return result.getPageId();
		// return "home"
	}

}
