package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import org.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import org.robotlegs.demos.helloflex.model.proxies.UserProxy;
	import org.robotlegs.demos.helloflex.view.components.LoginPage;
	import org.robotlegs.mvcs.Command;

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