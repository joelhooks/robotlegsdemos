package org.robotlegs.demos.acmewidgetfactory.modules.logger
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.controller.LoggerShutdownCommand;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvas;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.view.LoggerCanvasMediator;
	import org.robotlegs.mvcs.Context;
	
	public class LoggerModuleContext extends Context
	{
		public function LoggerModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Controller
			commandMap.mapEvent(ContextEvent.SHUTDOWN, LoggerShutdownCommand, ContextEvent, true);
			
			// View
			mediatorMap.mapView(LoggerCanvas, LoggerCanvasMediator);
			
			// Ready
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	
	}
}