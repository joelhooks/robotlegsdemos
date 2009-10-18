package org.robotlegs.demos.helloflex.view
{
	import org.robotlegs.demos.helloflex.controller.SystemEvent;
	import org.robotlegs.demos.helloflex.model.UserProxyEvent;
	import org.robotlegs.demos.helloflex.services.IAuthService;
	import org.robotlegs.demos.helloflex.view.LoginPage;
	import org.robotlegs.demos.helloflex.view.LoginPageEvent;
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
			eventMap.mapListener(loginPage, LoginPageEvent.LOGIN_SUBMITTED, onLoginSubmitted);
			// context listeners
			eventMap.mapListener(eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn);
		}
		
		private function onLoginSubmitted(e:LoginPageEvent):void
		{
			authService.login(loginPage.usernameTxt.text, loginPage.passwordTxt.text);
		}
		
		private function whenUserLoggedIn(e:UserProxyEvent):void
		{
			eventDispatcher.dispatchEvent(triggerEvent);
			loginPage.closeAndRemove();
		}
	
	}
}