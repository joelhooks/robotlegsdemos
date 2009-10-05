package org.robotlegs.demos.helloflex.services
{
	import org.robotlegs.demos.helloflex.model.UserProxy;
	import org.robotlegs.mvcs.Service;
	
	public class DummyAuthService extends Service implements IAuthService
	{
		[Inject]
		public var userProxy:UserProxy;
		
		public function DummyAuthService()
		{
		}
		
		public function login(username:String, password:String):void
		{
			// This would normally be asynchronous
			userProxy.setUsername(username);
			userProxy.userLoggedIn = true;
		}
		
		public function logout():void
		{
			userProxy.userLoggedIn = false;
		}
	
	}
}