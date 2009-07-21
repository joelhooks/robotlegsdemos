package org.robotlegs.demos.helloflex.view.mediators
{
	import flash.events.MouseEvent;

	import org.robotlegs.demos.helloflex.model.events.UserProxyEvent;
	import org.robotlegs.demos.helloflex.model.proxies.UserProxy;
	import org.robotlegs.demos.helloflex.remote.services.IAuthService;
	import org.robotlegs.demos.helloflex.view.components.LogoutButton;
	import org.robotlegs.mvcs.FlexMediator;

	public class LogoutButtonMediator extends FlexMediator
	{
		[Inject]
		public var logoutButton:LogoutButton;

		[Inject]
		public var userProxy:UserProxy;

		[Inject]
		public var authService:IAuthService;

		public function LogoutButtonMediator()
		{
		}

		override public function onRegister():void
		{
			// Yes, this could use binding instead
			logoutButton.enabled = userProxy.userLoggedIn;
			// view listeners
			addEventListenerTo( logoutButton, MouseEvent.CLICK, onLogoutClick );
			// context listeners
			addEventListenerTo( eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn );
			addEventListenerTo( eventDispatcher, UserProxyEvent.USER_LOGGED_OUT, whenUserLoggedOut );
		}

		private function onLogoutClick( e:MouseEvent ):void
		{
			authService.logout();
		}

		private function whenUserLoggedIn( e:UserProxyEvent ):void
		{
			logoutButton.enabled = true;
		}

		private function whenUserLoggedOut( e:UserProxyEvent ):void
		{
			logoutButton.enabled = false;
		}

	}
}