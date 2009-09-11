package org.robotlegs.demos.flashgooglemaps.view.mediators.content
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TipView;
	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;

	import flash.events.Event;

	public class TipViewMediator extends Mediator
	{
		[Inject]
		public var view:TipView;
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TipViewMediator()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function onRegister():void
		{
			view.main();
			
			// you could also use:
			// addEventListenerTo(view, MouseEvent.MOUSE_DOWN, handleShowTip);
			addEventListenerTo(view, TipView.SHOW_TIP, handleShowTip);
			addEventListenerTo(eventDispatcher, TipViewEvent.SHOW_TIP, handleShowTipReset);
		}
		
		override public function onRemove():void
		{
			view.destroy();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleShowTip(event:Event):void
		{
			dispatch(new TipViewEvent(TipViewEvent.SHOW_TIP, view.id));
		}
		
		private function handleShowTipReset(event:TipViewEvent):void
		{
			if(view.id != event.id) view.resetView();
		}
	}
}