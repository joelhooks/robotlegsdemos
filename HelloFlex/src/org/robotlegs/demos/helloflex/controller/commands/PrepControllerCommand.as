package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import org.robotlegs.mvcs.Command;
	
	public class PrepControllerCommand extends Command
	{
		
		override public function execute():void
		{
			commandMap.mapEvent(SystemEvent.CLEAR_MESSAGES_REQUESTED, TryClearMessages);
		}
	
	}
}