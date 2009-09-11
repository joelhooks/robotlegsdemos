package org.robotlegs.demos.flashgooglemaps.model.services
{
	import org.robotlegs.mvcs.Service;
	import org.robotlegs.demos.flashgooglemaps.model.events.GeoCodingServiceEvent;
	
	import com.google.maps.services.ClientGeocoder;
	import com.google.maps.services.GeocodingEvent;
	import com.google.maps.LatLng;

	public class GeoCodingService extends Service
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
		public function GeoCodingService()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
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
		private function handleGeocodingSuccess(event:GeocodingEvent):void
		{
			var placemarks:Array = event.response.placemarks;
        	
        	//trace(LatLng(placemarks[0].point).lat());
        	//trace(LatLng(placemarks[0].point).lng());
        	
        	dispatch(new GeoCodingServiceEvent(GeoCodingServiceEvent.GEOCODING_RESULT, placemarks));
        	
        	removeListeners();
		}
		
		private function handleGeocodingFailure(event:GeocodingEvent):void
		{
			//TODO
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function removeListeners():void
		{
			_geocoder.removeEventListener(GeocodingEvent.GEOCODING_SUCCESS, handleGeocodingSuccess);
			_geocoder.removeEventListener(GeocodingEvent.GEOCODING_FAILURE, handleGeocodingFailure);
			_geocoder = null;
		}
	}
}