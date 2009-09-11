package org.robotlegs.demos.flashgooglemaps.model.events
{
	import flash.events.Event;
	
	public class GeoCodingServiceEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const GEOCODING_RESULT:String = "geocodingResult";
		public static const GEOCODING_ERROR:String = "geoCodingError";
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _placemarks:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function GeoCodingServiceEvent(type:String, placemarks:Array)
		{
			super(type);
			
			_placemarks = placemarks;
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get placemarks():Array
		{
			return _placemarks;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new GeoCodingServiceEvent(type, placemarks);
		}
	}
}