package org.robotlegs.demos.whereswindow.controller
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.mvcs.Command;

	public class RemoveInfoWindowCommand extends Command implements ICommand
	{
		[Inject]
		public var event:InfoWindowEvent;
		
		[Inject]
		public var openWindowsProxy:OpenWindowsProxy;
		
		override public function execute():void
		{
			if(openWindowsProxy.hasWindowUID( event.uid ))
				openWindowsProxy.removeWindowByUID( event.uid );
		}
	}
}