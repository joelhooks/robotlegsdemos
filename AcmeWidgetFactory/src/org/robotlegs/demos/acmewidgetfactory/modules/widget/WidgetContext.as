package org.robotlegs.demos.acmewidgetfactory.modules.widget
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SpringInjector;
	import org.robotlegs.adapters.SpringReflector;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class WidgetContext extends Context
	{
		public function WidgetContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SpringInjector(), new SpringReflector());
		}
		
		override public function startup():void
		{
			// Map Startup Commands
			commandFactory.mapCommand(ContextEvent.STARTUP, WidgetStartupCommand, true);
			// And away we go!
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	
	}
}