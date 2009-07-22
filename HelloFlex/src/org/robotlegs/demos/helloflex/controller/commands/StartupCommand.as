package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class StartupCommand extends Command
	{
		
		override public function execute():void
		{
			// Do some custom startup stuff here!
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}