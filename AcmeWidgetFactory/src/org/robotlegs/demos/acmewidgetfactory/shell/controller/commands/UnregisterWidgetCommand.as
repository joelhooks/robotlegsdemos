package org.robotlegs.demos.acmewidgetfactory.shell.controller.commands
{
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.proxies.ActiveWidgetProxy;
	import org.robotlegs.mvcs.Command;
	
	public class UnregisterWidgetCommand extends Command
	{
		[Inject]
		public var event:ShellWidgetEvent;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		override public function execute():void
		{
			if (activeWidgetProxy.hasWidgetId(event.widgetId))
			{
				activeWidgetProxy.removeById(event.widgetId);
			}
		}
	}
}