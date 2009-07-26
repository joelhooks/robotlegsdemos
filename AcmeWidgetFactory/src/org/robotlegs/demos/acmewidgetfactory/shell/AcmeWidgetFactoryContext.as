package org.robotlegs.demos.acmewidgetfactory.shell
{
	import flash.display.DisplayObjectContainer;
	
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;
	
	import org.robotlegs.adapters.SpringInjector;
	import org.robotlegs.adapters.SpringReflector;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.StartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;

	public class AcmeWidgetFactoryContext extends Context
	{
		public function AcmeWidgetFactoryContext(contextView:DisplayObjectContainer)
		{
			super(contextView, new SpringInjector(), new SpringReflector());
		}
		
		override public function startup():void
		{
			commandFactory.mapCommand(ContextEvent.STARTUP, StartupCommand, true);
			// And away we go!
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}