package org.robotlegs.demos.acmewidgetfactory.modules.logger.controller
{
	import flash.events.Event;
	
	public class LoggerEvent extends Event
	{
		public static const LOG_MESSAGE:String = 'LOG_MESSAGE';
		public static const CLEAR_MESSAGES:String = 'CLEAR_MESSAGES';
		
		protected var _message:String;
		
		public function LoggerEvent(type:String, message:String = '')
		{
			super(type);
			_message = message;
		}
		
		public function get message():String
		{
			return _message;
		}
		
		override public function clone():Event
		{
			return new LoggerEvent(type, message);
		}
	
	}
}