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

package org.robotlegs.demos.flashgooglemaps.view.components.googlemaps
{
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	import com.google.maps.LatLng;
	import com.google.maps.Map;
	import com.google.maps.MapAction;
	import com.google.maps.MapEvent;
	import com.google.maps.MapMouseEvent;
	import com.google.maps.MapOptions;
	import com.google.maps.MapType;
	import com.google.maps.overlays.Marker;
	import com.google.maps.overlays.MarkerOptions;
	import com.google.maps.services.GeocodingEvent;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarker;
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarkers;
	import org.robotlegs.demos.flashgooglemaps.view.events.GoogleMarkerEvent;
	
	/**
	 * The implementation of the Googlemap view.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */
	[Embed(source='assets/swf/contentAssets.swf', symbol='MapHolder')]
	public class GoogleMapsView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const GOOGLEMAP_READY:String = "googleMapReady";
		public static const VIEW_ON_STAGE:String = "viewOnStage";
		public static const GET_GEOCODING_RESULT:String = "getGeocodingResult";
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var holder:MovieClip;
		
		private var _map:Map;
        private var _placemarks:Array;
        private var _infoWindows:Array = [];
        private var _activeMarker:Marker;
        private var _mapMarkers:MapMarkers;
        private var _zoomed:Boolean = false;
        
        //--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------
		public function GoogleMapsView()
		{
			super();
		}
		
		public function main():void
		{
			initializeView();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get zoomed():Boolean
		{
			return _zoomed;
		}
		
		public function show():void
		{
			Tweener.addTween(this, 
							  {x:0, 
							  alpha:1, 
							  delay:.3,
							  time:1.5, 
							  transition:Equations.easeOutQuint, 
							  onComplete:handleEvent, 
							  onCompleteParams:[new Event(GoogleMapsView.VIEW_ON_STAGE)]
							  });
		}

		public function hide():void
		{
			visible = false;
		}
		
		public function resetView():void
		{
			_map.setZoom(7);
			_map.panTo(new LatLng(52.3644935, 5.1779126));
			_activeMarker.visible = true;
			
			hideAllSmartInfoWindows();
			
			_zoomed = false;
		}
		
		public function createMarkers(mapMarkers:MapMarkers):void
		{
			_mapMarkers = mapMarkers;
			
			_mapMarkers.markers.forEach(createMarker);
		}
		
		public function showGeocodingSuccess(placemarks:Array):void 
		{	
            if(placemarks != null && placemarks.length > 0)
            {
	        	_map.setZoom(16);
	        	_map.panTo(placemarks[0].point);
	        	_map.panBy(new Point(-22, -190));
	        	_zoomed = true;
	    	}
        }

        public function showGeocodingFailure(event:GeocodingEvent):void 
        {
        	//TODO
        }
        
        public function showTipOnMap(markerid:uint):void
        {
        	if(_activeMarker != null)
        		_activeMarker.visible = true;
        	
        	var mapMarker:MapMarker = _mapMarkers.markers[markerid];
        	
        	hideAllSmartInfoWindows();
			
			requestGeocoding(mapMarker);
			
			mapMarker.smartInfoWindow.show();
			mapMarker.smartInfoWindow.marker.visible = false;
			_activeMarker = mapMarker.smartInfoWindow.marker;
			
			_zoomed = true;
        }
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleEvent(event:*):void
		{
			switch(event.type) 
			{
				case MapEvent.MAP_READY:
			  		dispatchEvent(new Event(GoogleMapsView.GOOGLEMAP_READY));
				break;
				case SmartInfoWindow.RESET_MAP:
					_map.setZoom(7);
					_map.panTo(new LatLng(52.3644935, 5.1779126));
					_activeMarker.visible = true;
					_zoomed = false;
				break;
				case GoogleMapsView.VIEW_ON_STAGE:
					dispatchEvent(event);
				break;
			}
		}
		
		private function handleMapPreinitialize(event:Event):void
		{
		   _map.setInitOptions(
		       new MapOptions({
		         mapType:MapType.NORMAL_MAP_TYPE,
		         center:new LatLng(52.3644935, 5.1779126),
		         zoom:7,
		         dragging:false,
		         doubleClickMode:MapAction.ACTION_NOTHING
		   }));
 		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function initializeView():void 
		{
			x = -800;
			y = 250;
			alpha = 0;
			
			_map = new Map();
			_map.key = FlashGoogleMaps.GOOGLE_MAPS_API_KEY;
			_map.url = FlashGoogleMaps.GOOGLE_MAPS_URL;
			_map.setSize(new Point(363, 392));
			_map.addEventListener(MapEvent.MAP_PREINITIALIZE, handleMapPreinitialize);
			_map.addEventListener(MapEvent.MAP_READY, handleEvent);
			holder.addChild(_map);
		}
		
		private function createMarker(mapMarker:MapMarker, index:int, mapMarkers:Vector.<MapMarker>):void
		{
			var markerOptions:MarkerOptions = new MarkerOptions();
			markerOptions.icon = new CustomMarkerIcon();
			markerOptions.iconAlignment = MarkerOptions.ALIGN_HORIZONTAL_CENTER + MarkerOptions.ALIGN_VERTICAL_CENTER;
			markerOptions.hasShadow = false;
			
			var marker:Marker = new Marker(mapMarker.latlng, markerOptions);
			
			mapMarker.smartInfoWindow.marker = marker;
			mapMarker.smartInfoWindow.addEventListener(SmartInfoWindow.RESET_MAP, handleEvent);
			addChild(mapMarker.smartInfoWindow);
			_infoWindows.push(mapMarker.smartInfoWindow);
			
			initializeBehaviour(mapMarker, marker);
			
			_map.addOverlay(marker);
		}
		
		private function initializeBehaviour(mapMarker:MapMarker, marker:Marker):void
		{
			marker.addEventListener(MapMouseEvent.CLICK, 
				function(event:MapMouseEvent):void
				{
					hideAllSmartInfoWindows();
					
					requestGeocoding(mapMarker);
					
					mapMarker.smartInfoWindow.show();
					marker.visible = false;
					_activeMarker = marker;
				}
			);
		}
		
		private function requestGeocoding(mapMarker:MapMarker):void
		{
			dispatchEvent(new GoogleMarkerEvent(GoogleMapsView.GET_GEOCODING_RESULT, mapMarker.city, mapMarker.address));
		}
		
		private function hideAllSmartInfoWindows():void
		{
			var i:uint;
			
			for(i = 0; i < _infoWindows.length; i++)
			{
				SmartInfoWindow(_infoWindows[i]).hide();
			}
		}
	}
}