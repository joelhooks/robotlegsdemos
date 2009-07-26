package org.robotlegs.demos.acmewidgetfactory.modules.logger.controller
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class LoggerShutdownCommand extends Command
	{
		override public function execute():void
		{
			dispatch(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
		}
	}
}