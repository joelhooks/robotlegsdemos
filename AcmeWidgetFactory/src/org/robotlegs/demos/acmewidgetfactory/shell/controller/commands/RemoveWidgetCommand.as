package org.robotlegs.demos.acmewidgetfactory.shell.controller.commands
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.proxies.ActiveWidgetProxy;
	import org.robotlegs.mvcs.Command;
	
	public class RemoveWidgetCommand extends Command
	{
		[Inject]
		public var event:ShellWidgetEvent;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		override public function execute():void
		{
			var widget:IWidgetModule = activeWidgetProxy.getWidget(event.widgetId);
			if (widget)
			{
				activeWidgetProxy.getWidget(event.widgetId).close();
			}
		}
	}
}