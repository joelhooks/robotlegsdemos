package org.robotlegs.demos.flashgooglemaps.view.mediators.content
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.events.SystemEvent;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;

	public class TabViewMediator extends Mediator
	{
		[Inject]
		public var view:TabView
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TabViewMediator()
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
			addEventListenerTo(eventDispatcher, SystemEvent.GOOGLE_MAP_ON_STAGE, handleShow);
			addEventListenerTo(eventDispatcher, ContentChangeEvent.CONTENT_CHANGE, handleTextEventContentChange);
			addEventListenerTo(view, ContentChangeEvent.CONTENT_CHANGE, handleContentChange);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleShow(event:SystemEvent):void
		{
			view.show();
		}
		
		private function handleContentChange(event:ContentChangeEvent):void
		{
			dispatch(event);
		}
		
		private function handleTextEventContentChange(event:ContentChangeEvent):void
		{
			view.goToTab(event.id + 1);
		}
	}
}