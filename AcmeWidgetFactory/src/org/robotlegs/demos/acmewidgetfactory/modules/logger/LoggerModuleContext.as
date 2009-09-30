package org.robotlegs.demos.acmewidgetfactory.modules.logger
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.controller.LoggerStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class LoggerModuleContext extends Context
	{
		public function LoggerModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Map Startup Commands
			commandMap.mapEvent(ContextEvent.STARTUP, LoggerStartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}