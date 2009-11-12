package org.robotlegs.examples.clock.view 
{
	import flash.text.TextField;
	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	public class DigitalClock extends Sprite implements ITimeDisplay
	{
		protected var timeDisplay:TextField;
		
		public function DigitalClock()
		{
			timeDisplay = new TextField();
			addChild(timeDisplay);
		}
		
		public function updateTime(newTime:Number):void
		{
			timeDisplay.text = newTime.toString();
		}
	}
}
