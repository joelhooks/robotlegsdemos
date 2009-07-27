package org.robotlegs.demos.acmewidgetfactory.shell.controller
{
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetProxy;
	import org.robotlegs.mvcs.Command;
	
	public class UnregisterWidgetCommand extends Command
	{
		[Inject]
		public var event:ShellWidgetEvent;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		override public function execute():void
		{
			var id:String = event.widgetId;
			if (activeWidgetProxy.hasWidgetId(id))
			{
				activeWidgetProxy.removeById(id);
			}
		}
	}
}