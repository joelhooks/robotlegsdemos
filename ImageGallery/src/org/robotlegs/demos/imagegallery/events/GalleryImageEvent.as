/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package  org.robotlegs.demos.imagegallery.events
{
	
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	
	import flash.events.Event;

	public class GalleryImageEvent extends Event
	{
		public static const SELECT_GALLERY_IMAGE:String = "selectGalleryImage";
		
		public var image:GalleryImage;
		
		public function GalleryImageEvent(type:String, image:GalleryImage)
		{
			this.image = image;
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new GalleryImageEvent(this.type, this.image);
		}
	}
}