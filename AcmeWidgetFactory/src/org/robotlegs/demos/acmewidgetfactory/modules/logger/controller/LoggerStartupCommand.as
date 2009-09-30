package org.robotlegs.demos.acmewidgetfactory.modules.logger.controller
{
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvas;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvasMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class LoggerStartupCommand extends Command
	{
		override public function execute():void
		{
			// Controller
			commandMap.mapEvent(ContextEvent.SHUTDOWN, LoggerShutdownCommand, true);
			
			// View
			mediatorMap.map(LoggerCanvas, LoggerCanvasMediator);
			
			// Ready
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}