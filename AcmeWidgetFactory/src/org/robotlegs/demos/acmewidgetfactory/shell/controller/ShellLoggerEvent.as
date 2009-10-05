package org.robotlegs.demos.acmewidgetfactory.shell.controller
{
	import flash.events.Event;
	
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	
	public class ShellLoggerEvent extends Event
	{
		public static const CREATE_LOGGER:String = 'CREATE_LOGGER';
		public static const CREATE_LOGGER_COMPLETE:String = 'CREATE_LOGGER_COMPLETE';
		
		public static const REMOVE_LOGGER:String = 'REMOVE_LOGGER';
		public static const REMOVE_LOGGER_COMPLETE:String = 'REMOVE_LOGGER_COMPLETE';
		
		public static const SHUTDOWN_LOGGER_COMPLETE:String = 'SHUTDOWN_LOGGER_COMPLETE';
		
		protected var _loggerModule:ILoggerModule;
		
		public function ShellLoggerEvent(type:String, loggerModule:ILoggerModule)
		{
			super(type);
			_loggerModule = loggerModule;
		}
		
		public function get loggerModule():ILoggerModule
		{
			return _loggerModule;
		}
		
		override public function clone():Event
		{
			return new ShellLoggerEvent(type, loggerModule);
		}
	
	}
}