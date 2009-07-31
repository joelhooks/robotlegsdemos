package org.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;
	
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.impl.DefaultLogger;
	import org.robotlegs.adapters.SmartyPantsInjector;
	import org.robotlegs.adapters.SmartyPantsReflector;
	import org.robotlegs.demos.helloflex.controller.commands.*;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class HelloFlexContext extends Context
	{
		
		public function HelloFlexContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SmartyPantsInjector(), new SmartyPantsReflector());
			// Keep SmartyPants quiet
			NoSmartyPantsLogging;
		}
		
		override public function startup():void
		{
			// Map our startup commands
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepModelCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepControllerCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepServicesCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepViewCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, StartupCommand, true);
			// And away we go!
			super.startup();
		}
		
		override protected function createLogger():ILogger
		{
			// Let's create a logger for this context
			return new DefaultLogger('HelloFlexContext');
		}
	
	}
}