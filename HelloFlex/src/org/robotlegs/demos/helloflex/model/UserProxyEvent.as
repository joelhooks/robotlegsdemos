package org.robotlegs.demos.helloflex.model
{
	import flash.events.Event;
	
	public class UserProxyEvent extends Event
	{
		public static const USERNAME_CHANGED:String = 'usernameChanged';
		public static const USER_LOGGED_IN:String = 'userLoggedIn';
		public static const USER_LOGGED_OUT:String = 'userLoggedOut';
		
		public function UserProxyEvent(type:String)
		{
			super(type);
		}
	
	}
}