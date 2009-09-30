package org.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.helloflex.controller.commands.*;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class HelloFlexContext extends Context
	{
		
		public function HelloFlexContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Map our startup commands
			commandMap.mapEvent(ContextEvent.STARTUP, PrepModelCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepControllerCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepServicesCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}