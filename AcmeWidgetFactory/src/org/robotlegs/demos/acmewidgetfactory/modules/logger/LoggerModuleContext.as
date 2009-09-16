package org.robotlegs.demos.acmewidgetfactory.modules.logger
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.adapters.SwiftSuspendersReflector;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.controller.LoggerStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class LoggerModuleContext extends Context
	{
		public function LoggerModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SwiftSuspendersInjector(), new SwiftSuspendersReflector());
		}
		
		override public function startup():void
		{
			// Map Startup Commands
			commandFactory.mapCommand(ContextEvent.STARTUP, LoggerStartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}