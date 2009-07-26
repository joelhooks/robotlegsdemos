package org.robotlegs.demos.acmewidgetfactory.shell.events
{
	import flash.events.Event;
	
	public class ShellEvent extends Event
	{
		public static const REMOVE_ALL_WIDGETS:String = 'REMOVE_ALL_WIDGETS';
		
		public function ShellEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event
		{
			return new ShellEvent(type);
		}
	
	}
}