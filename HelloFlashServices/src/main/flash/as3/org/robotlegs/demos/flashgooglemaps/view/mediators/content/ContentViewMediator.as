package org.robotlegs.demos.flashgooglemaps.view.mediators.content
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.model.proxies.AssetLoaderProxy;
	import org.robotlegs.demos.flashgooglemaps.model.events.AssetLoaderProxyEvent;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.events.SystemEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;

	import flash.events.Event;

	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;

	public class ContentMediator extends Mediator
	{
		[Inject]
		public var assetLoaderProxy:AssetLoaderProxy;
		
		[Inject]
		public var view:ContentView;
		
		private var xml:XML;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function ContentMediator()
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
			addEventListenerTo(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			addEventListenerTo(eventDispatcher, SystemEvent.GOOGLE_MAP_ON_STAGE, handleShow);
			addEventListenerTo(eventDispatcher, ContentChangeEvent.CONTENT_CHANGE, handleContentChange);
			addEventListenerTo(view, ContentView.SHOW_TIP_ON_MAP, handleShowTipOnMap);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleXMLContentLoaded(event:AssetLoaderProxyEvent):void
		{
			xml = event.asset as XML;
			
			view.showPlainTextView(xml..content[0]);
		}
		
		private function handleShow(event:SystemEvent):void
		{
			view.show();
		}
		
		private function handleContentChange(event:ContentChangeEvent):void
		{
			if(event.id == 1)
				view.showTipTextView(xml..content[1]);
			else
				view.showPlainTextView(xml..content[event.id]);
		}
		
		private function handleShowTipOnMap(event:Event):void
		{
			var id:uint = view.activeTip.id;
			dispatch(new TipViewEvent(TipViewEvent.TIP_VIEW_EVENT, id));
		}
	}
}