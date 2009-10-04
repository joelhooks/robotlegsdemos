package org.robotlegs.demos.imagegallery.test.cases
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.fluint.sequence.SequenceEventDispatcher;
	import org.fluint.sequence.SequenceRunner;
	import org.fluint.sequence.SequenceWaiter;
	import org.fluint.uiImpersonation.UIImpersonator;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.demos.imagegallery.views.components.GalleryView;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryViewMediator;

	public class TestGalleryViewMediation
	{
		private var view:GalleryView;
		private var mediator:GalleryViewMediator;
		
		[Before(async, ui)]
		public function setUp():void
		{
			this.view = new GalleryView();
			this.mediator = new GalleryViewMediator();
			
			this.mediator.galleryView = view;
			this.mediator.setViewComponent(view);
			this.mediator.eventDispatcher = new EventDispatcher()
			
			mediator.onRegister();
			
			Async.proceedOnEvent(this, this.view, Event.ADDED_TO_STAGE);
			UIImpersonator.addChild( this.view );
		}
		
		[After(async, ui)]
		public function tearDown():void
		{
			this.mediator.onRemove();
			this.mediator.eventDispatcher = null;
			this.view = null;
			this.mediator.galleryView = null;
		}
		
		[Test]
		public function testViewExists():void
		{
			Assert.assertNotNull( mediator.galleryView );
			Assert.assertNotNull( mediator.getViewComponent() );
		}
		
		[Test(async)]
		public function testImageSourceChangedOnSelect():void
		{
			var galleryImage:GalleryImage = new GalleryImage()
			galleryImage.URL = "http://www.example.com/nothing.jpg";
			
			mediator.eventDispatcher.addEventListener(GalleryImageEvent.SELECT_GALLERY_IMAGE, 
				Async.asyncHandler(this, handleImageSelected, 2000, galleryImage));
			view.dispatchEvent(new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, 
				galleryImage));
		}
		
		[Test(async)]
		public function testGalleryLoaded():void
		{
			var gallery:Gallery = testGallery;
				
			mediator.eventDispatcher.addEventListener(GalleryEvent.GALLERY_LOADED, 
				Async.asyncHandler(this, handleGalleryLoaded, 2000, gallery));
			mediator.eventDispatcher.dispatchEvent(new GalleryEvent(
				GalleryEvent.GALLERY_LOADED, gallery));
		}
		
		[Test(async)]
		public function testImageSetAfterGalleryLoaded():void
		{
			var gallery:Gallery = testGallery;
	    	var sequence:SequenceRunner = new SequenceRunner( this );

			with ( sequence ) {

				addStep( new SequenceEventDispatcher( mediator.eventDispatcher, 
					new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery) ) );
				addStep( new SequenceWaiter( mediator.eventDispatcher, 
					GalleryImageEvent.SELECT_GALLERY_IMAGE, 500 ) );
				
				addAssertHandler( handleImageSelectedAfterGalleryLoad, gallery );
				
				run();
			}			
		}
		
		protected function get testGallery():Gallery
		{
			var image1:GalleryImage = new GalleryImage()
			var image2:GalleryImage = new GalleryImage()
			var gallery:Gallery = new Gallery()
			gallery.photos.addItem(image1);
			gallery.photos.addItem(image2);		
			
			return gallery;		
		}
		
		protected function handleImageSelected( event:GalleryImageEvent,image:GalleryImage):void
		{
			Assert.assertEquals(event.image.URL, view.imageSource);
		}
		
		protected function handleGalleryLoaded( event:GalleryEvent, 
												passThrough:Gallery):void
		{
			Assert.assertEquals(event.gallery, passThrough);
		}
		
		protected function handleImageSelectedAfterGalleryLoad( event:GalleryImageEvent, gallery:Gallery):void
		{
			Assert.assertEquals(view.dataProvider, gallery.photos);
			Assert.assertEquals(event.image, gallery.photos[0]);
		}
	}
}