package org.robotlegs.demos.helloflex.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.helloflex.model.UserProxyEvent;
	import org.robotlegs.demos.helloflex.model.UserProxy;
	import org.robotlegs.demos.helloflex.services.IAuthService;
	import org.robotlegs.demos.helloflex.view.LogoutButton;
	import org.robotlegs.mvcs.Mediator;
	
	public class LogoutButtonMediator extends Mediator
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
			addEventListenerTo(logoutButton, MouseEvent.CLICK, onLogoutClick);
			// context listeners
			addEventListenerTo(eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn);
			addEventListenerTo(eventDispatcher, UserProxyEvent.USER_LOGGED_OUT, whenUserLoggedOut);
		}
		
		private function onLogoutClick(e:MouseEvent):void
		{
			authService.logout();
		}
		
		private function whenUserLoggedIn(e:UserProxyEvent):void
		{
			logoutButton.enabled = true;
		}
		
		private function whenUserLoggedOut(e:UserProxyEvent):void
		{
			logoutButton.enabled = false;
		}
	
	}
}