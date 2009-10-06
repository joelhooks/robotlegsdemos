package org.robotlegs.demos.acmewidgetfactory.modules.widget.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class WidgetCanvasMediator extends Mediator
	{
		[Inject]
		public var view:WidgetCanvas;
		
		public function WidgetCanvasMediator()
		{
		}
		
		override public function onRegister():void
		{
			view.flipColor();
			
			// View Listeners
			addEventListenerTo(view.killButton, MouseEvent.CLICK, onKillClick);
			
			// Context Listeners
			addEventListenerTo(eventDispatcher, WidgetEvent.SET_WIDGET_TITLE, onSetWidgetTitle);
			addEventListenerTo(eventDispatcher, WidgetEvent.POKE_WIDGET, onPokeWidget);
		}
		
		protected function onKillClick(e:MouseEvent):void
		{
			dispatchEvent(new ContextEvent(ContextEvent.SHUTDOWN));
		}
		
		protected function onSetWidgetTitle(e:WidgetEvent):void
		{
			view.title.text = e.body;
		}
		
		protected function onPokeWidget(e:WidgetEvent):void
		{
			view.flipColor();
			dispatchEvent(new WidgetEvent(WidgetEvent.POKE_WIDGET_COMPLETE));
		}
	}
}