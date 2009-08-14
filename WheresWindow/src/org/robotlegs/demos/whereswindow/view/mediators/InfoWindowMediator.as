package org.robotlegs.demos.whereswindow.view.mediators
{
	import flash.events.Event;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.mvcs.FlexMediator;

	public class InfoWindowMediator extends FlexMediator implements IMediator
	{
		public function InfoWindowMediator()
		{
			super();
		}

		override public function onRegister():void
		{
			trace("Window Mediator Registered", view.id);
			addEventListenerTo( eventDispatcher, InfoWindowEvent.CHANGE_BACKGROUND_COLOR, handleChangeBackgroundColor );
			addEventListenerTo( eventDispatcher, InfoWindowEvent.FLASH_INFO_WINDOW, handleFlashWindow );
			addEventListenerTo( view, Event.CLOSE, handleWindowClose );
		}
		
		protected function handleChangeBackgroundColor(event:InfoWindowEvent):void
		{
			if(event.uid && event.uid != this.view.id)
				return;
			view.switchColors();
		}
		
		protected function handleFlashWindow(event:InfoWindowEvent):void
		{
			if(event.uid && event.uid != this.view.id)
				return;	
			trace("found window, flashing...", view.id);
			view.orderToFront();
			view.flashWindow();		
		}
		
		protected function handleWindowClose(event:Event):void
		{
			dispatch( new InfoWindowEvent( InfoWindowEvent.INFO_WINDOW_CLOSED, view.id ) );
			mediatorFactory.removeMediator( this );
		}
		
		protected function get view():InfoWindow
		{
			return this.viewComponent as InfoWindow;
		}
	}
}