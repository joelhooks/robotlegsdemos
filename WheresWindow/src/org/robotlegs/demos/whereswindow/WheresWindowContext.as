package org.robotlegs.demos.whereswindow
{
	import flash.display.DisplayObjectContainer;
	
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;
	
	import org.robotlegs.adapters.SmartyPantsInjector;
	import org.robotlegs.adapters.SmartyPantsReflector;
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.whereswindow.controller.StartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;

	public class WheresWindowContext extends Context implements IContext
	{
		public function WheresWindowContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SmartyPantsInjector(), new SmartyPantsReflector());
			NoSmartyPantsLogging;
		}
		
		override public function startup():void
		{
			commandFactory.mapCommand( ContextEvent.STARTUP, StartupCommand, true );
			eventBroadcaster.dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );
		}
	}
}