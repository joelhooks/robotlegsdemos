package net.boyblack.robotlegs.demos.helloflex.controller.events
{
	import flash.events.Event;

	public class SystemEvent extends Event
	{
		public static const STARTUP:String = 'startup';
		public static const STARTUP_COMPLETE:String = 'startupComplete';
		public static const CLEAR_MESSAGES_REQUESTED:String = 'clearMessagesRequested';

		public function SystemEvent( type:String )
		{
			super( type );
		}

		override public function clone():Event
		{
			return new SystemEvent( type );
		}

	}
}