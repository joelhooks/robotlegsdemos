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
	
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;

	public class GalleryEvent extends Event
	{
		public static const LOAD_GALLERY:String = "loadGallery";
		public static const GALLERY_LOADED:String = "galleryLoaded";
		
		public var gallery:Gallery;
		
		public function GalleryEvent(type:String, gallery:Gallery = null)
		{
			this.gallery = gallery;
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new GalleryEvent(this.type, this.gallery);
		}
	}
}