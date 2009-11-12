package org.robotlegs.examples.clock.controller {
	import flash.events.Event;
	import flash.events.TimerEvent;

	/**
	 * @author John Lindquist
	 */
	public class TimeUpdateEvent extends TimerEvent 
	{
		public static const TIME_UPDATED:String = "TIME_UPDATED";
		
		private var _newTime:Number;
		public function get newTime():Number
		{
			return _newTime;
		}
		
		public function set newTime(newTime:Number):void
		{
			_newTime = newTime;
		}
		
		public function TimeUpdateEvent(type:String, newTime:Number, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			this.newTime = newTime;
			super(type, bubbles, cancelable);
		}

		override public function clone():Event
		{
			return new TimeUpdateEvent(type, newTime, bubbles, cancelable);
		}
	}
}
