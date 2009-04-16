package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepControllerCommand extends Command
	{

		override public function execute():void
		{
			commandFactory.mapCommand( SystemEvent.CLEAR_MESSAGES_REQUESTED, TryClearMessages );
		}

	}
}