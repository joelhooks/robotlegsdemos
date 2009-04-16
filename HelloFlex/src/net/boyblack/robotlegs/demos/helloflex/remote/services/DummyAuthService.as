package net.boyblack.robotlegs.demos.helloflex.remote.services
{
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.UserProxy;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class DummyAuthService extends FlexMediator implements IAuthService
	{
		[Inject]
		public var userProxy:UserProxy;

		public function DummyAuthService()
		{
		}

		public function login( username:String, password:String ):void
		{
			// This would normally be asynchronous
			userProxy.setUsername( username );
			userProxy.userLoggedIn = true;
		}

		public function logout():void
		{
			userProxy.userLoggedIn = false;
		}

	}
}