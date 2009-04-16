package net.boyblack.robotlegs.demos.helloflex.view.mediators
{
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.demos.helloflex.model.events.UserProxyEvent;
	import net.boyblack.robotlegs.demos.helloflex.remote.services.IAuthService;
	import net.boyblack.robotlegs.demos.helloflex.view.components.LoginPage;
	import net.boyblack.robotlegs.demos.helloflex.view.events.LoginPageEvent;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class LoginPageMediator extends FlexMediator
	{
		[Inject]
		public var loginPage:LoginPage;

		[Inject]
		public var authService:IAuthService;

		[Inject( name='LoginTrigger' )]
		public var triggerEvent:SystemEvent;

		public function LoginPageMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			// view listeners
			addEventListenerTo( loginPage, LoginPageEvent.LOGIN_SUBMITTED, onLoginSubmitted );
			// context listeners
			addEventListenerTo( eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn );
		}

		private function onLoginSubmitted( e:LoginPageEvent ):void
		{
			authService.login( loginPage.usernameTxt.text, loginPage.passwordTxt.text );
		}

		private function whenUserLoggedIn( e:UserProxyEvent ):void
		{
			dispatch( triggerEvent );
			loginPage.closeAndRemove();
		}

	}
}