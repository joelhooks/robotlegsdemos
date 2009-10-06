package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellWidgetEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class ControlPanelMediator extends Mediator
	{
		[Inject]
		public var view:ControlPanelView;
		
		public function ControlPanelMediator()
		{
		}
		
		override public function onRegister():void
		{
			addEventListenerTo(view.createWidgetButton, MouseEvent.CLICK, onCreateWidgetClick);
			addEventListenerTo(view.pokeWidgetButton, MouseEvent.CLICK, onPokeWidgetClick);
			addEventListenerTo(view.destroyWidgetButton, MouseEvent.CLICK, onDestroyWidgetClick);
			addEventListenerTo(view.destroyAllWidgetsButton, MouseEvent.CLICK, onDestroyAllClick);
			addEventListenerTo(view.clearLoggerButton, MouseEvent.CLICK, onClearLoggerClick);
		}
		
		protected function onCreateWidgetClick(e:MouseEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.CREATE_WIDGET, view.widgetId.text));
		}
		
		protected function onPokeWidgetClick(e:MouseEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.POKE_WIDGET, view.widgetId.text));
		}
		
		protected function onDestroyWidgetClick(e:MouseEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET, view.widgetId.text));
		}
		
		protected function onDestroyAllClick(e:MouseEvent):void
		{
			dispatchEvent(new ShellEvent(ShellEvent.REMOVE_ALL_WIDGETS));
		}
	
		protected function onClearLoggerClick(e:MouseEvent):void
		{
			dispatchEvent(new ShellEvent(ShellEvent.CLEAR_LOGGER));
		}
	
	}
}