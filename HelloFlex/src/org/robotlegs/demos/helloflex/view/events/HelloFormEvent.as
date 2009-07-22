package org.robotlegs.demos.helloflex.view.events
{
	import flash.events.Event;
	
	public class HelloFormEvent extends Event
	{
		public static const FORM_SUBMITTED:String = 'formSubmitted';
		
		public function HelloFormEvent(type:String)
		{
			super(type, true);
		}
	
	}
}