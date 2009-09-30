package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.demos.helloflex.view.components.*;
	import org.robotlegs.demos.helloflex.view.mediators.*;
	import org.robotlegs.mvcs.Command;
	
	public class PrepViewCommand extends Command
	{
		
		override public function execute():void
		{
			mediatorMap.map(HelloForm, HelloFormMediator);
			mediatorMap.map(MessageList, MessageListMediator);
			mediatorMap.map(ClearMessagesButton, ClearMessagesButtonMediator);
			mediatorMap.map(LoginPage, LoginPageMediator);
			mediatorMap.map(LogoutButton, LogoutButtonMediator);
			mediatorMap.map(SimpleLogBox, SimpleLogBoxMediator);
		}
	
	}
}