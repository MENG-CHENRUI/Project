package home.service;

import home.form.LoginForm;
import home.result.ServiceResult;

public interface Service {
	public ServiceResult execute(LoginForm form);
}
