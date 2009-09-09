package org.robotlegs.demos.flashgooglemaps.view.events
{
	import flash.events.Event;
	
	public class ContentChangeEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const CONTENT_CHANGE:String = "contentChange";
		
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
		public function ContentChangeEvent(type:String, id:uint)
		{
			super(type);
			
			_id = id;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Getters and setters
		//
		//--------------------------------------------------------------------------
		public function get id():uint
		{
			return _id;
		}
		
		//--------------------------------------------------------------------------
		//
		// Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new ContentChangeEvent(type, id);
		}
	}
}