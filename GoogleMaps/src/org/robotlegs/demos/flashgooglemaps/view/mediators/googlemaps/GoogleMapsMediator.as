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
	import org.robotlegs.demos.flashgooglemaps.model.events.AssetLoaderProxyEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.GoogleMarkerEvent;
	import org.robotlegs.demos.flashgooglemaps.model.events.GeoCodingServiceEvent;
	import org.robotlegs.demos.flashgooglemaps.events.SystemEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarkers;
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarker;

	import flash.events.Event;

	import com.google.maps.LatLng;

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
			
			eventMap.mapListener(view, GoogleMapsView.GOOGLEMAP_READY, handleGoogleMapReady);
			eventMap.mapListener(view, GoogleMapsView.GET_GEOCODING_RESULT, handleGeocodingRequest);
			eventMap.mapListener(view, GoogleMapsView.VIEW_ON_STAGE, handleViewOnStage);
			eventMap.mapListener(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			eventMap.mapListener(eventDispatcher, GeoCodingServiceEvent.GEOCODING_RESULT, handleGeocodingResult);
			eventMap.mapListener(eventDispatcher, TipViewEvent.SHOW_TIP, handleTipViewEvent);
			eventMap.mapListener(eventDispatcher, ContentChangeEvent.CONTENT_CHANGE, handleContentChange);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleGoogleMapReady(event:Event):void
		{
			dispatch(new SystemEvent(SystemEvent.LOAD_CONTENT));
		}
		
		private function handleXMLContentLoaded(event:AssetLoaderProxyEvent):void
		{
			view.createMarkers(parseMarkers(event.xml));
			
			view.show();
			
			eventMap.unmapListener(view, GoogleMapsView.GOOGLEMAP_READY, handleGoogleMapReady);
			eventMap.unmapListener(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			
			dispatch(new SystemEvent(SystemEvent.CLEANUP_STARTUP));
		}
		
		private function handleGeocodingRequest(event:GoogleMarkerEvent):void
		{
			dispatch(new SystemEvent(SystemEvent.REQUEST_GEOCODING, {city:event.city, address:event.address}));
		}
		
		private function handleGeocodingResult(event:GeoCodingServiceEvent):void
		{
			view.showGeocodingSuccess(event.placemarks);
		}
		
		private function handleViewOnStage(event:Event):void
		{
			dispatch(new SystemEvent(SystemEvent.GOOGLE_MAP_ON_STAGE));
			
			eventMap.unmapListener(view, GoogleMapsView.VIEW_ON_STAGE, handleViewOnStage);
		}
		
		private function handleTipViewEvent(event:TipViewEvent):void
		{
			view.showTipOnMap(event.id);
		}
		
		private function handleContentChange(event:ContentChangeEvent):void
		{
			if(view.zoomed) view.resetView();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Takes the xml we loaded and creates a collection (MapMarkers) of the marker
		 * objects found in the xml. Creates a MapMarker for each <marker> tag.
		 * 
		 * Note: I decided to use the VO's because they make it a little easier
		 * to provide the data to the GoogleView and the Googlemaps API.
		 * 
		 * @param data XML
		 * 
		 */		
		private function parseMarkers(data:XML):MapMarkers
		{
			var markers:XMLList = data..marker;
			var markersCount:uint = markers.length();
			var mapMarkers:MapMarkers = new MapMarkers();
			
			if(markersCount > 0)
			{
				var i:uint;
				
				for(i = 0; i < markersCount; i++)
				{
					var markerXml:XML = markers[i];
					var marker:MapMarker = new MapMarker();
					marker.latlng = new LatLng(markerXml.@lat, markerXml.@lng);
					marker.city = markerXml.@stad;
					marker.address = markerXml.@adres;
					marker.smartInfoWindow.setHeadline(markerXml.@headline);
					marker.smartInfoWindow.setBody(markerXml.@body);
					marker.smartInfoWindow.setVisual(markerXml.@foto);
					
					mapMarkers.addMarker(marker);
				}
			}
			
			return mapMarkers;
		}
	}
}