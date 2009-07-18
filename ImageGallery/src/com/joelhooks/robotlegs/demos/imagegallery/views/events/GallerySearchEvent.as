package com.joelhooks.robotlegs.demos.imagegallery.views.events
{
	import flash.events.Event;
	
	public class GallerySearchEvent extends Event
	{
		public static const SEARCH:String = "search";
		
		public var searchTerm:String;
		
		public function GallerySearchEvent(type:String, searchTerm:String)
		{
			this.searchTerm = searchTerm;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new GallerySearchEvent(this.type, this.searchTerm);
		}
	}
}