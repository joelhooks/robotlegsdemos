package 
{
	import flash.display.DisplayObject;
	import org.robotlegs.examples.clock.view.ITimeDisplay;
	import org.robotlegs.examples.clock.view.DigitalClock;
	import org.robotlegs.examples.clock.ClockContext;

	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	public class Main extends Sprite 
	{
		public var timeDisplay:ITimeDisplay;
		
		public function Main() 
		{
			new ClockContext(this);
			
			timeDisplay = new DigitalClock();
			addChild(timeDisplay as DisplayObject);
		}
	}
}
