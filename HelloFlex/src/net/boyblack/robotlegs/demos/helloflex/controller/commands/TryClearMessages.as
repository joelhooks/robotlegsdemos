package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.UserProxy;
	import net.boyblack.robotlegs.demos.helloflex.view.components.LoginPage;
	import net.boyblack.robotlegs.mvcs.Command;

	public class TryClearMessages extends Command
	{
		[Inject]
		public var event:SystemEvent;

		[Inject]
		public var userProxy:UserProxy;

		[Inject]
		public var messageProxy:MessageProxy;

		override public function execute():void
		{
			if ( userProxy.userLoggedIn )
			{
				messageProxy.clearMessages();
			}
			else
			{
				injector.bindValue( SystemEvent, event, 'LoginTrigger' );
				contextView.addChild( new LoginPage() );
			}
		}
	}
}