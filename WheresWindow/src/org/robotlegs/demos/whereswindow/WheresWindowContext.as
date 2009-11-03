package org.robotlegs.demos.whereswindow
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.whereswindow.controller.CreateNewWindowCommand;
	import org.robotlegs.demos.whereswindow.controller.RemoveInfoWindowCommand;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.demos.whereswindow.view.components.OpenWindowList;
	import org.robotlegs.demos.whereswindow.view.components.WheresWindowView;
	import org.robotlegs.demos.whereswindow.view.mediators.InfoWindowMediator;
	import org.robotlegs.demos.whereswindow.view.mediators.OpenWindowsListMediator;
	import org.robotlegs.demos.whereswindow.view.mediators.WheresWindowViewMediator;
	import org.robotlegs.mvcs.Context;
	
	public class WheresWindowContext extends Context implements IContext
	{
		public function WheresWindowContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(OpenWindowsProxy);
			
			mediatorMap.mapView(InfoWindow, InfoWindowMediator);
			mediatorMap.mapView(OpenWindowList, OpenWindowsListMediator);
			mediatorMap.mapView(WheresWindowView, WheresWindowViewMediator);
			
			commandMap.mapEvent(InfoWindowEvent.CREATE_INFO_WINDOW, CreateNewWindowCommand, InfoWindowEvent );
			commandMap.mapEvent(InfoWindowEvent.INFO_WINDOW_CLOSED, RemoveInfoWindowCommand, InfoWindowEvent );
			
			super.startup();
		}
	}
}