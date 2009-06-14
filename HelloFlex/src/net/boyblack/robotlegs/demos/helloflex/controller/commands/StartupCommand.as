package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.mvcs.Command;

	public class StartupCommand extends Command
	{

		override public function execute():void
		{
			// Do some custom startup stuff here!
			dispatch( new SystemEvent( SystemEvent.STARTUP_COMPLETE ) );
		}
	}
}