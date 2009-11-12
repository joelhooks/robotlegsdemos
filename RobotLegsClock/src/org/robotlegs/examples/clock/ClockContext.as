package org.robotlegs.examples.clock 
{
	import org.robotlegs.examples.clock.view.DigitalClock;
	import org.robotlegs.examples.clock.model.TimeModel;
	import org.robotlegs.examples.clock.view.ITimeDisplay;
	import org.robotlegs.examples.clock.view.TimeDisplayMediator;
	import org.robotlegs.mvcs.Context;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author John Lindquist
	 */
	public class ClockContext extends Context 
	{
		public function ClockContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) 
		{
			super(contextView, autoStartup);
		}

		override public function startup():void
		{
			injector.mapSingleton(TimeModel);
			injector.instantiate(TimeModel);
			mediatorMap.mapView(DigitalClock, TimeDisplayMediator, ITimeDisplay);	
		}
	}
}
