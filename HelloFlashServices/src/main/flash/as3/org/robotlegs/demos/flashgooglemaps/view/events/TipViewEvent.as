package org.robotlegs.demos.flashgooglemaps.view.events
{
	import flash.events.Event;
	
	public class TipViewEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const TIP_VIEW_EVENT:String = "tipViewEvent";
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _id:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TipViewEvent(type:String, id:uint)
		{
			super(type);
			
			_id = id;
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get id():uint
		{
			return _id;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new TipViewEvent(type, id);
		}
	}
}