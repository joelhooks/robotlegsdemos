package org.robotlegs.demos.whereswindow.controller
{
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.mvcs.Command;
	
	public class CreateNewWindowCommand extends Command
	{
		[Inject]
		public var openWindowProxy:OpenWindowsProxy;
		
		[Inject]
		public var event:InfoWindowEvent;
		
		override public function execute():void
		{
			var window:InfoWindow;
			
			if (event.uid && openWindowProxy.hasWindowUID(event.uid))
			{
				window = openWindowProxy.getWindowFromUID(event.uid);
			}
			else
			{
				window = openWindowProxy.createWindow();
				mediatorMap.createMediator(window);
			}
			
			window.open();
			window.orderToFront();
		}
	}
}