package org.robotlegs.demos.whereswindow.view.mediators
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.view.components.WheresWindowView;
	import org.robotlegs.mvcs.Mediator;

	public class WheresWindowViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var view:WheresWindowView;
		
		public function WheresWindowViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( view.createWndowButton, MouseEvent.CLICK, handleCreateButton )
			eventMap.mapListener( view.changeAllBackgroundsButton, MouseEvent.CLICK, handleChangeColors );
		}
		
		protected function handleCreateButton(event:Event):void
		{
			eventDispatcher.dispatchEvent( new InfoWindowEvent( InfoWindowEvent.CREATE_INFO_WINDOW ) );
		}
		
		protected function handleChangeColors(event:Event):void
		{
			eventDispatcher.dispatchEvent( new InfoWindowEvent( InfoWindowEvent.CHANGE_BACKGROUND_COLOR ));
		}
		
	}
}