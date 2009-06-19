package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.mvcs.Command;
	import net.boyblack.robotlegs.mvcs.ContextEvent;

	public class StartupCommand extends Command
	{

		override public function execute():void
		{
			// Do some custom startup stuff here!
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}