/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.views.mediators
{
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Mediator;

	public class GalleryLabelMediator extends Mediator implements IMediator
	{
		[Inject]
		public var galleryLabel:GalleryLabel;

		[Inject]
		public var service:IGalleryImageService;
				
		public function GalleryLabelMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			this.galleryLabel.text = "interestingness";
			eventMap.mapListener( eventDispatcher, GallerySearchEvent.SEARCH, handleSearch );
			
			galleryLabel.visible = galleryLabel.includeInLayout = service.searchAvailable;
		}
		
		protected function setLabelText(value:String):void
		{
			this.galleryLabel.text = value;
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			this.setLabelText(event.searchTerm); 
		}
	}
}