package org.robotlegs.examples.clock.view 
{
	import org.robotlegs.examples.clock.controller.TimeUpdateEvent;
	import org.robotlegs.examples.clock.model.TimeModel;
	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author John Lindquist
	 */
	public class TimeDisplayMediator extends Mediator 
	{
		[Inject]
		public var timeDisplay:ITimeDisplay; //how does injection work with interfaces? Should I use "Abstract" classes instead?

		[Inject]
		public var timeModel:TimeModel;

		override public function onRegister():void
		{
			//Why do I still have to inject the TimeModel if I just use eventDispatcher?
			eventMap.mapListener(eventDispatcher, TimeUpdateEvent.TIME_UPDATED, handleTimeUpdate);	
		}

		protected function handleTimeUpdate(event:TimeUpdateEvent):void
		{
			timeDisplay.updateTime(event.newTime);
		}
	}
}
