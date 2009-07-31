package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class ControlPanelMediator extends FlexMediator
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
			dispatch(new ShellWidgetEvent(ShellWidgetEvent.CREATE_WIDGET, view.widgetId.text));
		}
		
		protected function onPokeWidgetClick(e:MouseEvent):void
		{
			dispatch(new ShellWidgetEvent(ShellWidgetEvent.POKE_WIDGET, view.widgetId.text));
		}
		
		protected function onDestroyWidgetClick(e:MouseEvent):void
		{
			dispatch(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET, view.widgetId.text));
		}
		
		protected function onDestroyAllClick(e:MouseEvent):void
		{
			dispatch(new ShellEvent(ShellEvent.REMOVE_ALL_WIDGETS));
		}
	
		protected function onClearLoggerClick(e:MouseEvent):void
		{
			dispatch(new ShellEvent(ShellEvent.CLEAR_LOGGER));
		}
	
	}
}