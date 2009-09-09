package org.robotlegs.demos.flashgooglemaps.events
{
	import flash.events.Event;
	
	public class SystemEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const GOOGLE_MAP_ON_STAGE:String = "googleMapOnStage";
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _body:*;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function SystemEvent(type:String, body:* = null)
		{
			super(type);
			
			_body = body;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters and setters
		//
		//--------------------------------------------------------------------------
		public function get body():*
		{
			return _body;
		}
		
		//--------------------------------------------------------------------------
		//
		// Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new SystemEvent(type, body);
		}
	}
}