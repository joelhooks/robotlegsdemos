/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

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
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;

	import flash.events.Event;

	/**
	 * GoogleMapsMediator. Note the way you declare a dependency and from
	 * that point on use the instance in your code.
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
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
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */		
		public function GoogleMapsMediator()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */		
		override public function onRegister():void
		{
			view.main();
			
			addEventListenerTo(view, GoogleMapsView.GOOGLEMAP_READY, handleGoogleMapReady);
			addEventListenerTo(view, GoogleMapsView.GET_GEOCODING_RESULT, handleGeocodingRequest);
			addEventListenerTo(view, GoogleMapsView.VIEW_ON_STAGE, handleViewOnStage);
			addEventListenerTo(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			addEventListenerTo(eventDispatcher, GeoCodingServiceEvent.GEOCODING_RESULT, handleGeocodingResult);
			addEventListenerTo(eventDispatcher, TipViewEvent.SHOW_TIP, handleTipViewEvent);
			addEventListenerTo(eventDispatcher, ContentChangeEvent.CONTENT_CHANGE, handleContentChange);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleGoogleMapReady(event:Event):void
		{
			assetLoaderProxy.loadXMLContent("assets/xml/content.xml");
		}
		
		private function handleXMLContentLoaded(event:AssetLoaderProxyEvent):void
		{
			view.createMarkers(assetLoaderProxy.markers);
			
			view.show();
			
			assetLoaderProxy.destroy();
			
			removeEventListenerFrom(view, GoogleMapsView.GOOGLEMAP_READY, handleGoogleMapReady);
			removeEventListenerFrom(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
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
			
			removeEventListenerFrom(view, GoogleMapsView.VIEW_ON_STAGE, handleViewOnStage);
		}
		
		private function handleTipViewEvent(event:TipViewEvent):void
		{
			view.showTipOnMap(event.id);
		}
		
		private function handleContentChange(event:ContentChangeEvent):void
		{
			if(view.zoomed) view.resetView();
		}
	}
}