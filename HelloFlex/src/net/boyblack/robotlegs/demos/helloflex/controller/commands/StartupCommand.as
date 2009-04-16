package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.mvcs.Command;
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;

	public class StartupCommand extends Command
	{

		override public function execute():void
		{
			// This prevents SmartyPants from logging all it's actions to the console
			NoSmartyPantsLogging;
			dispatch( new SystemEvent( SystemEvent.STARTUP_COMPLETE ) );
		}
	}
}