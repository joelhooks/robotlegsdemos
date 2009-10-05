package org.robotlegs.demos.helloflex.view
{
	import flash.events.Event;
	
	public class LoginPageEvent extends Event
	{
		public static const LOGIN_SUBMITTED:String = 'loginSubmitted';
		public static const LOGIN_CANCELLED:String = 'loginCancelled';
		
		public function LoginPageEvent(type:String)
		{
			super(type, true);
		}
	
	}
}