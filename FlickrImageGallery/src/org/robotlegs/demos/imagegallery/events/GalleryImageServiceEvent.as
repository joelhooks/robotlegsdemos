/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.events
{
	import flash.events.Event;
	
	public class GalleryImageServiceEvent extends Event
	{
		public static const SERVICE_READY:String = "serviceReady";
		
		public var service:Object;
		public function GalleryImageServiceEvent(type:String, service:Object = null)
		{
			this.service = service;
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new GalleryImageServiceEvent(this.type, this.service);
		}
	}
}