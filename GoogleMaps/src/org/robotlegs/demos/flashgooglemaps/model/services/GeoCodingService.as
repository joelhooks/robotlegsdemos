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

package org.robotlegs.demos.flashgooglemaps.model.services
{
	import com.google.maps.services.ClientGeocoder;
	import com.google.maps.services.GeocodingEvent;
	
	import org.robotlegs.demos.flashgooglemaps.model.events.GeoCodingServiceEvent;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * A Service to get us some results from the Googlemaps API.
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	public class GeoCodingService extends Actor
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _geocoder:ClientGeocoder;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * No comment. 
		 * 
		 */		
		public function GeoCodingService()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		/**
		 * Googlemaps, can we have some results please.
		 *  
		 * @param city String
		 * @param address String
		 * 
		 */		
		public function requestGeocoding(city:String, address:String):void
		{
			_geocoder = new ClientGeocoder();
			_geocoder.addEventListener(GeocodingEvent.GEOCODING_SUCCESS, handleGeocodingSuccess);
			_geocoder.addEventListener(GeocodingEvent.GEOCODING_FAILURE, handleGeocodingFailure);
			_geocoder.geocode(city + "," + address);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handler. Dispatches a GeoCodingServiceEvent holding the placemarks
		 * to the GoogleMapsMediator to provide the data to its view component.
		 * When done, takes care of clean up by removing event listeners.
		 * 
		 * @param event GeocodingEvent
		 * 
		 */		
		private function handleGeocodingSuccess(event:GeocodingEvent):void
		{
			var placemarks:Array = event.response.placemarks;
        	
        	//trace(LatLng(placemarks[0].point).lat());
        	//trace(LatLng(placemarks[0].point).lng());
        	
        	dispatch(new GeoCodingServiceEvent(GeoCodingServiceEvent.GEOCODING_RESULT, placemarks));
        	
        	removeListeners();
		}
		
		/**
		 * Yeah, to do.
		 * 
		 * @param event GeocodingEvent
		 * 
		 */		
		private function handleGeocodingFailure(event:GeocodingEvent):void
		{
			//TODO
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Clean up. 
		 * 
		 */		
		private function removeListeners():void
		{
			_geocoder.removeEventListener(GeocodingEvent.GEOCODING_SUCCESS, handleGeocodingSuccess);
			_geocoder.removeEventListener(GeocodingEvent.GEOCODING_FAILURE, handleGeocodingFailure);
			_geocoder = null;
		}
	}
}