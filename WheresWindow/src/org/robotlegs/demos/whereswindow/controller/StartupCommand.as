package org.robotlegs.demos.whereswindow.controller
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.demos.whereswindow.view.components.OpenWindowList;
	import org.robotlegs.demos.whereswindow.view.components.WheresWindowView;
	import org.robotlegs.demos.whereswindow.view.mediators.InfoWindowMediator;
	import org.robotlegs.demos.whereswindow.view.mediators.OpenWindowsListMediator;
	import org.robotlegs.demos.whereswindow.view.mediators.WheresWindowViewMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class StartupCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			trace("Startup");
			injector.bindSingleton(OpenWindowsProxy);
			
			mediatorMap.map(InfoWindow, InfoWindowMediator);
			mediatorMap.map(WheresWindowView, WheresWindowViewMediator);
			mediatorMap.map(OpenWindowList, OpenWindowsListMediator);
			
			commandMap.mapEvent(InfoWindowEvent.CREATE_INFO_WINDOW, CreateNewWindowCommand);
			commandMap.mapEvent(InfoWindowEvent.INFO_WINDOW_CLOSED, RemoveInfoWindowCommand);
			
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}