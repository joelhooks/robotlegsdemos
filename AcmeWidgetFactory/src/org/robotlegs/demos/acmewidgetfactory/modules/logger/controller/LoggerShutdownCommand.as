package org.robotlegs.demos.acmewidgetfactory.modules.logger.controller
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class LoggerShutdownCommand extends Command
	{
		override public function execute():void
		{
			// perhaps we want to do something before shutting down
			eventDispatcher.dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
		}
	}
}