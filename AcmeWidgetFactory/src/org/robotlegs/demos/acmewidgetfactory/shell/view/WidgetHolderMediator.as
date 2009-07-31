package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import flash.display.DisplayObject;
	
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.events.ActiveWidgetProxyEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.proxies.ActiveWidgetProxy;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class WidgetHolderMediator extends FlexMediator
	{
		[Inject]
		public var view:WidgetHolderView;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		public function WidgetHolderMediator()
		{
		}
		
		override public function onRegister():void
		{
			addEventListenerTo(eventDispatcher, ActiveWidgetProxyEvent.WIDGET_CREATED, onWidgetCreated);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, onShutdownWidgetComplete);
		}
		
		protected function onWidgetCreated(e:ActiveWidgetProxyEvent):void
		{
			view.addChild(activeWidgetProxy.getWidget(e.widgetId));
		}
		
		protected function onShutdownWidgetComplete(e:ShellWidgetEvent):void
		{
			view.removeChild(activeWidgetProxy.getWidget(e.widgetId) as DisplayObject);
			dispatch(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, e.widgetId));
		}
	}
}