package org.robotlegs.demos.flashgooglemaps.view.mediators.content
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.PlainTextView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;

	import flash.events.Event;

	public class PlainTextViewMediator extends Mediator
	{
		[Inject]
		public var view:PlainTextView;
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function PlainTextViewMediator()
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
			addEventListenerTo(view, PlainTextView.SHOW_TIPS, handleShowTips);
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
		private function handleShowTips(event:Event):void
		{
			dispatch(new ContentChangeEvent(ContentChangeEvent.CONTENT_CHANGE, TabView.CONTENT_TIPS));
		}
	}
}