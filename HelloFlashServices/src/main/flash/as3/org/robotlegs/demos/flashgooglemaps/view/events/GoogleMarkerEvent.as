package org.robotlegs.demos.flashgooglemaps.view.events
{
	import flash.events.Event;
	
	public class GoogleMarkerEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _city:String;
		private var _address:String;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function GoogleMarkerEvent(type:String, city:String, address:String)
		{
			super(type);
			
			_city = city;
			_address = address;
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get city():String
		{
			return _city;
		}
		
		public function get address():String
		{
			return _address;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new GoogleMarkerEvent(type, city, address);
		}
	}
}