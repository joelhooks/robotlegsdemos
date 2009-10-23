package org.robotlegs.demos.helloflex.model
{
	import org.robotlegs.mvcs.Model;
	
	public class UserProxy extends Model
	{
		private var username:String;
		private var loggedIn:Boolean;
		
		public function UserProxy()
		{
		}
		
		public function setUsername(username:String):void
		{
			this.username = username;
			dispatch(new UserProxyEvent(UserProxyEvent.USERNAME_CHANGED));
		}
		
		public function set userLoggedIn(value:Boolean):void
		{
			loggedIn = value;
			if (loggedIn)
			{
				dispatch(new UserProxyEvent(UserProxyEvent.USER_LOGGED_IN));
			}
			else
			{
				dispatch(new UserProxyEvent(UserProxyEvent.USER_LOGGED_OUT));
			}
		}
		
		public function get userLoggedIn():Boolean
		{
			return loggedIn;
		}
	
	}
}