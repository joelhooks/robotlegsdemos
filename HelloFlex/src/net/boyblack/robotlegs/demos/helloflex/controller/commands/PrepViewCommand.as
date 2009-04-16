package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.view.components.*;
	import net.boyblack.robotlegs.demos.helloflex.view.mediators.*;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepViewCommand extends Command
	{

		override public function execute():void
		{
			mediatorFactory.mapMediator( HelloForm, HelloFormMediator );
			mediatorFactory.mapMediator( MessageList, MessageListMediator );
			mediatorFactory.mapMediator( ClearMessagesButton, ClearMessagesButtonMediator );
			mediatorFactory.mapMediator( LoginPage, LoginPageMediator );
			mediatorFactory.mapMediator( LogoutButton, LogoutButtonMediator );
			mediatorFactory.mapMediator( SimpleLogBox, SimpleLogBoxMediator );
		}

	}
}