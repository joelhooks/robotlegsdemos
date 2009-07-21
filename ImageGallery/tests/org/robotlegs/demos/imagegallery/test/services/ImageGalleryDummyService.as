package org.robotlegs.demos.imagegallery.test.services
{
	import flash.events.EventDispatcher;
	
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.mvcs.Service;

	public class ImageGalleryDummyService extends Service implements IGalleryImageService
	{
		public function ImageGalleryDummyService()
		{
		}
		
		public function loadGallery():void
		{
			this.dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED))
		}
		
		public function search(searchTerm:String):void
		{
			this.dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED))
		}
	}
}