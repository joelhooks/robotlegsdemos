package org.robotlegs.demos.flashgooglemaps.view.mediators.googlemaps
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.GoogleMapsView;
	import org.robotlegs.demos.flashgooglemaps.model.proxies.AssetLoaderProxy;
	import org.robotlegs.demos.flashgooglemaps.model.events.AssetLoaderProxyEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.GoogleMarkerEvent;
	import org.robotlegs.demos.flashgooglemaps.model.services.GeoCodingService;
	import org.robotlegs.demos.flashgooglemaps.model.events.GeoCodingServiceEvent;
	import org.robotlegs.demos.flashgooglemaps.events.SystemEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;

	import flash.events.Event;

	public class GoogleMapsMediator extends Mediator
	{
		[Inject]
		public var view:GoogleMapsView;
		
		[Inject]
		public var assetLoaderProxy:AssetLoaderProxy;
		
		[Inject]
		public var geocodingService:GeoCodingService;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function GoogleMapsMediator()
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
			addEventListenerTo(view, GoogleMapsView.GOOGLEMAP_READY, handleGoogleMapReady);
			addEventListenerTo(view, GoogleMapsView.GET_GEOCODING_RESULT, handleGeocodingRequest);
			addEventListenerTo(view, GoogleMapsView.VIEW_ON_STAGE, handleViewOnStage);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleGoogleMapReady(event:Event):void
		{
			addEventListenerTo(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			addEventListenerTo(eventDispatcher, GeoCodingServiceEvent.GEOCODING_RESULT, handleGeocodingResult);
			addEventListenerTo(eventDispatcher, TipViewEvent.TIP_VIEW_EVENT, handleTipViewEvent);
			
			assetLoaderProxy.loadXMLContent("assets/xml/content.xml");
		}
		
		private function handleXMLContentLoaded(event:AssetLoaderProxyEvent):void
		{
			view.createMarkers(assetLoaderProxy.markers);
			
			view.show();
		}
		
		private function handleGeocodingRequest(event:GoogleMarkerEvent):void
		{
			geocodingService.requestGeocoding(event.city, event.address);
		}
		
		private function handleGeocodingResult(event:GeoCodingServiceEvent):void
		{
			view.showGeocodingSuccess(event.placemarks);
		}
		
		private function handleViewOnStage(event:Event):void
		{
			dispatch(new SystemEvent(SystemEvent.GOOGLE_MAP_ON_STAGE));
		}
		
		private function handleTipViewEvent(event:TipViewEvent):void
		{
			view.showTipOnMap(event.id);
		}
	}
}