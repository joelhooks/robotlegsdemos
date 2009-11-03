package org.robotlegs.demos.acmewidgetfactory.modules.widget
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetShutdownCommand;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvas;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvasMediator;
	import org.robotlegs.mvcs.Context;
	
	public class WidgetModuleContext extends Context
	{
		public function WidgetModuleContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Controller
			commandMap.mapEvent(ContextEvent.SHUTDOWN, WidgetShutdownCommand, ContextEvent, true);
			
			// View
			mediatorMap.mapView(WidgetCanvas, WidgetCanvasMediator);
			
			// Ready
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	
	}
}