package org.robotlegs.demos.acmewidgetfactory.shell.controller
{
	import flash.events.Event;
	
	public class ShellWidgetEvent extends Event
	{
		public static const CREATE_WIDGET:String = 'CREATE_WIDGET';
		
		public static const POKE_WIDGET:String = 'POKE_WIDGET';
		public static const POKE_WIDGET_COMPLETE:String = 'POKE_WIDGET_COMPLETE';
		
		public static const REMOVE_WIDGET:String = 'REMOVE_WIDGET';
		public static const REMOVE_WIDGET_COMPLETE:String = 'REMOVE_WIDGET_COMPLETE';
		
		public static const SHUTDOWN_WIDGET_COMPLETE:String = 'SHUTDOWN_WIDGET_COMPLETE';
		
		protected var _widgetId:String;
		
		public function ShellWidgetEvent(type:String, widgetId:String)
		{
			super(type);
			_widgetId = widgetId;
		}
		
		public function get widgetId():String
		{
			return _widgetId;
		}
		
		override public function clone():Event
		{
			return new ShellWidgetEvent(type, widgetId);
		}
	
	}
}