package org.robotlegs.demos.acmewidgetfactory.modules.logger.controller
{
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvasMediator;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvas;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class LoggerStartupCommand extends Command
	{
		override public function execute():void
		{
			// Controller
			commandFactory.mapCommand(ContextEvent.SHUTDOWN, LoggerShutdownCommand, true);
			
			// View
			mediatorFactory.mapMediator(LoggerCanvas, LoggerCanvasMediator);
			
			// Ready
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}