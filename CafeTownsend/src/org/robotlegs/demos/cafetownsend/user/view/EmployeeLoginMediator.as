package org.robotlegs.demos.cafetownsend.user.view
{
import mx.validators.Validator;

import org.robotlegs.demos.cafetownsend.user.model.EmployeeLoginModel;
import org.robotlegs.demos.cafetownsend.user.model.events.EmployeeLoginEvent;
import org.robotlegs.demos.cafetownsend.user.service.interfaces.IEmployeeLoginService;
import org.robotlegs.demos.cafetownsend.user.view.components.interfaces.IEmployeeLogin;
import org.robotlegs.mvcs.Mediator;

public class EmployeeLoginMediator extends Mediator
{
	[Inject]
	public var employeeLogin:IEmployeeLogin;
	[Inject]
	public var employeeLoginModel:EmployeeLoginModel;
	[Inject]
	public var employeeLoginService:IEmployeeLoginService;
	[Inject]
	public var usernameValidator:Validator;
	[Inject]
	public var passwordValidator:Validator;
	
	override public function onRegister():void
	{
		eventMap.mapListener(employeeLogin, EmployeeLoginEvent.LOGIN, onLogin, EmployeeLoginEvent);
		eventMap.mapListener(eventDispatcher, EmployeeLoginEvent.HINT, whenHint, EmployeeLoginEvent);
		usernameValidator.source = employeeLogin.usernameValidatorSource;
		usernameValidator.property = employeeLogin.usernameValidatorProperty;
		usernameValidator.required = true;
		passwordValidator.source = employeeLogin.passwordValidatorSource;
		passwordValidator.property = employeeLogin.passwordValidatorProperty;
		passwordValidator.required = true;
		employeeLoginService.loadHint();
	}
	
	private function onLogin(event:EmployeeLoginEvent):void
	{
		if (!Validator.validateAll([ usernameValidator, passwordValidator ]).length)
		{
			employeeLogin.resetFocus();
			employeeLogin.usernameValidatorSource[employeeLogin.usernameValidatorProperty] = '';
			employeeLogin.usernameValidatorSource.errorString = '';
			employeeLogin.passwordValidatorSource[employeeLogin.passwordValidatorProperty] = '';
			employeeLogin.passwordValidatorSource.errorString = '';
			employeeLoginService.logIn(event.user);
		}
	}
	
	private function whenHint(event:EmployeeLoginEvent):void
	{
		employeeLogin.hint = employeeLoginModel.hint;
	}
	
}
}