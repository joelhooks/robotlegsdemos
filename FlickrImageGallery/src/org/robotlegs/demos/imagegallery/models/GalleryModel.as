/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.models
{
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.mvcs.*;

	public class GalleryModel extends Actor
	{
		private var _gallery:Gallery;
		
		public function GalleryModel()
		{
		}
		
		public function get gallery():Gallery
		{
			return this._gallery;
		}
		
		public function set gallery(v:Gallery):void
		{
			this._gallery = v;
			
		}
		
		public function setSelectedImage(selectedImage:GalleryImage):void
		{
			selectedImage.selected = true;
			for each(var image:GalleryImage in this._gallery.photos)
			{
				if(image != selectedImage)
					image.selected = false;
			}
		}
	}
}