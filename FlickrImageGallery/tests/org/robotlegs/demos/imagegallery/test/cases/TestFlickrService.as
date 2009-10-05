package org.robotlegs.demos.imagegallery.test.cases
{
	import flash.events.EventDispatcher;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.FlickrImageService;

	public class TestFlickrService
	{
		private var service:FlickrImageService;
		private var serviceDispatcher:EventDispatcher = new EventDispatcher();
		
		[Before]
		public function setUp():void
		{
			serviceDispatcher = new EventDispatcher();
			service = new FlickrImageService();
			service.eventDispatcher = serviceDispatcher;
		}
		
		[After]
		public function tearDown():void
		{
			this.serviceDispatcher = null;
			this.service = null;
		}
		
		[Test(async)]
		public function testRetreiveImages():void
		{
			this.serviceDispatcher.addEventListener( GalleryEvent.GALLERY_LOADED, 
				Async.asyncHandler(this, handleImagesReceived, 8000, null, 
				handleServiceTimeout), false, 0, true);
			this.service.loadGallery();
		}

		[Test(async)]
		public function testSearchImages():void
		{
			this.serviceDispatcher.addEventListener( GalleryEvent.GALLERY_LOADED, 
				Async.asyncHandler(this, handleImagesReceived, 8000, null, 
				handleServiceTimeout), false, 0, true);
			this.service.search("robotlegs");
		}
						
		protected function handleServiceTimeout( object:Object ):void
		{
	    	Assert.fail('Pending Event Never Occurred');
		}
		
		protected function handleImagesReceived(event:GalleryEvent, object:Object):void
		{
			Assert.assertEquals("The gallery should have some photos: ", 
				event.gallery.photos.length > 0, true)	
		}
		
		
	}
}