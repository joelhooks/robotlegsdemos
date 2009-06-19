package net.boyblack.robotlegs.demos.helloflex.controller.events
{
	import flash.events.Event;

	public class SystemEvent extends Event
	{
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