package org.robotlegs.demos.helloflex.view.mediators
{
	import org.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import org.robotlegs.demos.helloflex.model.events.UserProxyEvent;
	import org.robotlegs.demos.helloflex.remote.services.IAuthService;
	import org.robotlegs.demos.helloflex.view.components.LoginPage;
	import org.robotlegs.demos.helloflex.view.events.LoginPageEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class LoginPageMediator extends Mediator
	{
		[Inject]
		public var loginPage:LoginPage;
		
		[Inject]
		public var authService:IAuthService;
		
		[Inject(name='LoginTrigger')]
		public var triggerEvent:SystemEvent;
		
		public function LoginPageMediator()
		{
		}
		
		override public function onRegister():void
		{
			// view listeners
			addEventListenerTo(loginPage, LoginPageEvent.LOGIN_SUBMITTED, onLoginSubmitted);
			// context listeners
			addEventListenerTo(eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn);
		}
		
		private function onLoginSubmitted(e:LoginPageEvent):void
		{
			authService.login(loginPage.usernameTxt.text, loginPage.passwordTxt.text);
		}
		
		private function whenUserLoggedIn(e:UserProxyEvent):void
		{
			dispatch(triggerEvent);
			loginPage.closeAndRemove();
		}
	
	}
}