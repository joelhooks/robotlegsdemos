package org.robotlegs.demos.whereswindow.events
{
	import flash.events.Event;
	
	public class InfoWindowEvent extends Event
	{
		public static const CREATE_INFO_WINDOW:String = "createInfoWindow";
		public static const CHANGE_BACKGROUND_COLOR:String = "changeBackgroundColor";
		public static const INFO_WINDOW_ADDED:String = "infoWindowAdded";
		public static const FLASH_INFO_WINDOW:String = "flashInfoWindow";
		public static const INFO_WINDOW_CLOSED:String = "infoWindowClosed";
		public static const INFO_WINDOW_REMOVED:String = "infoWindowRemoved";
		
		public var uid:String;
		
		public function InfoWindowEvent(type:String, uid:String = null)
		{
			this.uid = uid;
			super(type, true, true);
		}
		
		override public function clone():Event
		{
			return new InfoWindowEvent(this.type, this.uid);
		}
	}
}