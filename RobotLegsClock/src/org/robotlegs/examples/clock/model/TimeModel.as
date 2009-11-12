package org.robotlegs.examples.clock.model 
{
	import org.robotlegs.examples.clock.controller.TimeUpdateEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import org.robotlegs.mvcs.Actor;

	/**
	 * @author John Lindquist
	 */
	public class TimeModel extends Actor 
	{
		public static const TIME_INCREMENT:Number = 1000;
		
		private var timer:Timer = new Timer(TIME_INCREMENT);
		private var timeTracker:Number = 0;
		
		public function TimeModel()
		{
			timer.addEventListener(TimerEvent.TIMER, handleTimer);
			timer.start();
		}
						
		protected function handleTimer(event:TimerEvent):void
		{
			timeTracker += TIME_INCREMENT / 1000;
			var timeUpdateEvent:TimeUpdateEvent = new TimeUpdateEvent(TimeUpdateEvent.TIME_UPDATED, timeTracker);
			
			dispatch(timeUpdateEvent);
		}
	}
}
