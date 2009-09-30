package org.robotlegs.demos.whereswindow
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.whereswindow.controller.StartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class WheresWindowContext extends Context implements IContext
	{
		public function WheresWindowContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, true);
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}