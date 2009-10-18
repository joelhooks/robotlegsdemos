package org.robotlegs.demos.acmewidgetfactory.shell.model
{
	import flash.events.Event;
	
	public class ActiveWidgetModelEvent extends Event
	{
		public static const WIDGET_MODULE_ERROR:String = 'WIDGET_MODULE_ERROR';
		public static const WIDGET_MODULE_PROGRESS:String = 'WIDGET_MODULE_PROGRESS';
		public static const WIDGET_MODULE_READY:String = 'WIDGET_MODULE_READY';
		
		public static const WIDGET_CREATED:String = 'WIDGET_CREATED';
		
		protected var _widgetId:String;
		protected var _body:*;
		
		public function ActiveWidgetModelEvent(type:String, widgetId:String, body:* = null)
		{
			super(type);
			_widgetId = widgetId;
			_body = body;
		}
		
		public function get widgetId():String
		{
			return _widgetId;
		}
		
		public function get body():*
		{
			return _body;
		}
		
		override public function clone():Event
		{
			return new ActiveWidgetModelEvent(type, widgetId, body);
		}
	
	}
}