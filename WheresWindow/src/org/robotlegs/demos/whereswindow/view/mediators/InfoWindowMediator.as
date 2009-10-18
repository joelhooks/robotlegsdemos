package org.robotlegs.demos.whereswindow.view.mediators
{
	import flash.events.Event;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.mvcs.Mediator;
	
	public class InfoWindowMediator extends Mediator implements IMediator
	{
		[Inject]
		public var view:InfoWindow;
		
		public function InfoWindowMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			trace("Window Mediator Registered", view.id);
			eventMap.mapListener(eventDispatcher, InfoWindowEvent.CHANGE_BACKGROUND_COLOR, handleChangeBackgroundColor);
			eventMap.mapListener(eventDispatcher, InfoWindowEvent.FLASH_INFO_WINDOW, handleFlashWindow);
			eventMap.mapListener(view, Event.CLOSE, handleWindowClose);
		}
		
		protected function handleChangeBackgroundColor(event:InfoWindowEvent):void
		{
			if (event.uid && event.uid != this.view.id)
				return;
			view.switchColors();
		}
		
		protected function handleFlashWindow(event:InfoWindowEvent):void
		{
			if (event.uid && event.uid != this.view.id)
				return;
			trace("found window, flashing...", view.id);
			view.orderToFront();
			view.flashWindow();
		}
		
		protected function handleWindowClose(event:Event):void
		{
			eventDispatcher.dispatchEvent(new InfoWindowEvent(InfoWindowEvent.INFO_WINDOW_CLOSED, view.id));
			mediatorMap.removeMediator(this);
		}
	
	}
}