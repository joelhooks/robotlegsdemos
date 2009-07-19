package com.joelhooks.robotlegs.demos.imagegallery.models.proxies
{
	import com.joelhooks.robotlegs.demos.imagegallery.events.GalleryEvent;
	import com.joelhooks.robotlegs.demos.imagegallery.models.vo.Gallery;
	import com.joelhooks.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	
	import org.robotlegs.mvcs.Proxy;

	public class GalleryProxy extends Proxy
	{
		private var _gallery:Gallery;
		
		public function GalleryProxy()
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