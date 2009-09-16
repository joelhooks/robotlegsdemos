package org.robotlegs.demos.acmewidgetfactory.shell
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.impl.DefaultLogger;
	import org.robotlegs.adapters.SwiftSuspendersInjector;
	import org.robotlegs.adapters.SwiftSuspendersReflector;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.commands.ShellStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class AcmeWidgetFactoryContext extends Context
	{
		public function AcmeWidgetFactoryContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SwiftSuspendersInjector(), new SwiftSuspendersReflector());
		}
		
		override public function startup():void
		{
			// Map our Startup Command
			commandFactory.mapCommand(ContextEvent.STARTUP, ShellStartupCommand, true);
			// And away we go!
			super.startup();
		}
		
		override protected function createLogger():ILogger
		{
			// Let's create a logger for this context so we can see what the framework is doing
			return new DefaultLogger('AcmeWidgetFactoryContext');
		}
	}
}