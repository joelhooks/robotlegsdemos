package org.robotlegs.demos.acmewidgetfactory.shell.controller
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.WidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetProxy;
	import org.robotlegs.mvcs.Command;
	
	public class CreateWidgetCommand extends Command
	{
		[Inject]
		public var event:ShellWidgetEvent;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		override public function execute():void
		{
			var id:String = event.widgetId;
			var widget:IWidgetModule;
			if (activeWidgetProxy.hasObjectId(id))
			{
				widget = activeWidgetProxy.getObject(id);
				widget.poke();
			}
			else
			{
				// bad: mustn't ref directly surely?
				widget = new WidgetModule();
				activeWidgetProxy.registerObject(widget, id);
				dispatch(new ShellWidgetEvent(ShellWidgetEvent.CREATE_WIDGET_COMPLETE, id));
			}
		}
	}
}