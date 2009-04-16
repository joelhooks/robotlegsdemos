package net.boyblack.robotlegs.demos.helloflex.model.events
{
	import flash.events.Event;

	public class UserProxyEvent extends Event
	{
		public static const USERNAME_CHANGED:String = 'usernameChanged';
		public static const USER_LOGGED_IN:String = 'userLoggedIn';
		public static const USER_LOGGED_OUT:String = 'userLoggedOut';

		public function UserProxyEvent( type:String )
		{
			super( type );
		}

	}
}