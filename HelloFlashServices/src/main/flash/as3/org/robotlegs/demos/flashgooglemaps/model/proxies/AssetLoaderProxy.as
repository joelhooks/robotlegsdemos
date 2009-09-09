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
		public function AssetLoaderProxy()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get markers():MapMarkers
		{
			return _markers;
		}
		
		public function loadXMLContent(url:String):void
		{
			var urlRequest:URLRequest = new URLRequest(url);
			_urlLoader = new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE, onXMLContentLoaded);
			_urlLoader.load(urlRequest);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
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