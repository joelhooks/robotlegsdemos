package org.robotlegs.demos.imagegallery.test.cases
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.events.FlexEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryLabelMediator;

	public class TestGalleryLabelMediation
	{
		private var galleryLabelMediator:GalleryLabelMediator;
		private var galleryLabel:GalleryLabel;
		
		import org.fluint.uiImpersonation.UIImpersonator;
		
		[Before(async,ui)]
		public function setUp():void
		{
			this.galleryLabel = new GalleryLabel();
			this.galleryLabelMediator = new GalleryLabelMediator()
			this.galleryLabelMediator.setViewComponent(this.galleryLabel);	
			this.galleryLabelMediator.galleryLabel = this.galleryLabel;
			this.galleryLabelMediator.eventDispatcher = new EventDispatcher();
			this.galleryLabelMediator.onRegister();
			Async.proceedOnEvent(this, galleryLabel, FlexEvent.CREATION_COMPLETE);
			UIImpersonator.addChild(galleryLabel);		
		}
		
		[After(async,ui)]
		public function tearDown():void
		{
			this.galleryLabel = null;
			this.galleryLabelMediator.onRemove();
			this.galleryLabelMediator.setViewComponent(null);
			this.galleryLabelMediator.eventDispatcher = null;
			this.galleryLabelMediator = null;
		}
		
		[Test]
		public function testMediatorHasViewComponent():void
		{
			Assert.assertNotNull( this.galleryLabelMediator.galleryLabel );
			Assert.assertNotNull( this.galleryLabelMediator.getViewComponent() );
		}
		
		[Test(async,ui)]
		public function testReceiveSearchEvent():void
		{
			var passThrough:Object = {};
			passThrough.searchTerm = "robotlegs";
			
			Async.handleEvent(this, this.galleryLabelMediator.eventDispatcher, 
				GallerySearchEvent.SEARCH, handleSearchEvent, 500, passThrough, handleTimeout);
			
			this.galleryLabelMediator.eventDispatcher.dispatchEvent(
				new GallerySearchEvent(GallerySearchEvent.SEARCH, "robotlegs"));
		}
		
		[Test(async,ui)] 
		public function textUpdatedAfterSearchEvent():void
		{
			var passThrough:Object = {};
			passThrough.searchTerm = "robotlegs";
			
			Async.handleEvent(this, this.galleryLabel, Event.CHANGE, 
				handleGalleryLabelTextChange, 500, passThrough, handleTimeout);
			this.galleryLabelMediator.eventDispatcher.dispatchEvent(
				new GallerySearchEvent(GallerySearchEvent.SEARCH, "robotlegs"));
		}
		
		protected function handleTimeout( passThrough:Object ):void
		{
			Assert.fail("Async event timed out");
		}
		
		protected function handleSearchEvent(event:GallerySearchEvent, passThrough:Object):void
		{
			Assert.assertEquals(event.searchTerm, passThrough.searchTerm);
		}
		
		protected function handleGalleryLabelTextChange(event:Event, passThrough:Object):void
		{
			Assert.assertEquals(this.galleryLabel.text, passThrough.searchTerm);
		}
		
	}
}