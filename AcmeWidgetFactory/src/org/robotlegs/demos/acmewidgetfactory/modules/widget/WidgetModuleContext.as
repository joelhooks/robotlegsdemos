package org.robotlegs.demos.acmewidgetfactory.modules.widget
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class WidgetModuleContext extends Context
	{
		public function WidgetModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Map Startup Commands
			commandMap.mapEvent(ContextEvent.STARTUP, WidgetStartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}