package org.robotlegs.demos.acmewidgetfactory.modules.widget.controller
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class WidgetShutdownCommand extends Command
	{
		override public function execute():void
		{
			// perhaps we want to do something before shutting down
			eventDispatcher.dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN_COMPLETE));
		}
	}
}