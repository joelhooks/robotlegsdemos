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

package org.robotlegs.demos.flashgooglemaps.model.proxies
{
	import org.robotlegs.mvcs.Proxy;
	import org.robotlegs.demos.flashgooglemaps.model.events.AssetLoaderProxyEvent;
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarkers;
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarker;
	
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLLoader;

	import com.google.maps.LatLng;
	
	/**
	 * Proxy to load the xml content.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	public class AssetLoaderProxy extends Proxy
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _urlLoader:URLLoader;
		private var _markers:MapMarkers;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Nah, no comment. 
		 * 
		 */		
		public function AssetLoaderProxy()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		/**
		 * Just an accessor to retrieve the MapMarkers collection.
		 * 
		 * @return MapMarkers
		 * 
		 */		
		public function get markers():MapMarkers
		{
			return _markers;
		}
		
		/**
		 * No comment.
		 *  
		 * @param url String
		 * 
		 */		
		public function loadXMLContent(url:String):void
		{
			var urlRequest:URLRequest = new URLRequest(url);
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onXMLContentLoaded);
			_urlLoader.load(urlRequest);
		}
		
		/**
		 * Just cleaning up. 
		 * 
		 */		
		public function destroy():void
		{
			_markers = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handler. Dispatches an AssetLoaderProxyEvent so the ContentMediator
		 * can pass the data to its view component.
		 *  
		 * @param event Event
		 * 
		 */		
		private function onXMLContentLoaded(event:Event):void 
		{
			var data:XML = new XML(_urlLoader.data);
			
			parseMarkers(data);
			
			dispatch(new AssetLoaderProxyEvent(AssetLoaderProxyEvent.XML_CONTENT_LOADED, data));
			
			_urlLoader.removeEventListener(Event.COMPLETE, onXMLContentLoaded);
			_urlLoader = null;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Takes the xml we loaded and creates a collection (MapMarkers) of the marker
		 * objects found in the xml. Creates a MapMarker for each <marker> tag.
		 * Saves the collection in _mapMarkers so we can retrieve it later on.
		 * Note: I decided to use the VO's because they make it a little easier
		 * to provide the data to the GoogleView and the Googlemaps API. Probably
		 * overkill for this demo.
		 * 
		 * @param data XML
		 * 
		 */		
		private function parseMarkers(data:XML):void
		{
			var markers:XMLList = data..marker;
			var markersCount:uint = markers.length();
			
			if(markersCount > 0)
			{
				var i:uint;
				_markers = new MapMarkers();
				
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
					
					_markers.addMarker(marker);
				}
			}
		}
	}
}