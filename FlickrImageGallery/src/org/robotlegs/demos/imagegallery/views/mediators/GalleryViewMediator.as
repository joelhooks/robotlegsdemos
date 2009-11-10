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
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.demos.imagegallery.views.components.GalleryView;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Mediator;

	public class GalleryViewMediator extends Mediator
	{
		[Inject]
		public var galleryView:GalleryView;
		
		public function GalleryViewMediator()
		{
		}

		override public function onRegister():void
		{
			eventMap.mapListener( galleryView, GalleryImageEvent.SELECT_GALLERY_IMAGE, onImageSelected )
			eventMap.mapListener( eventDispatcher, GalleryEvent.GALLERY_LOADED, onGalleryLoaded )
			eventMap.mapListener( eventDispatcher, GallerySearchEvent.SEARCH, onSearch);
			
			eventDispatcher.dispatchEvent( new GalleryEvent( GalleryEvent.LOAD_GALLERY ) );
		}
		
		protected function selectImage(image:GalleryImage):void
		{
			galleryView.imageSource = image.URL;
			eventDispatcher.dispatchEvent(new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, image));
		}
		
		protected function onGalleryLoaded(event:GalleryEvent):void
		{
			galleryView.dataProvider = event.gallery.photos;
			selectImage( event.gallery.photos[0] as GalleryImage );
		}
		
		protected function onImageSelected(event:GalleryImageEvent):void
		{
			this.selectImage(event.image);
		}
		
		protected function onSearch(event:GallerySearchEvent):void
		{
			this.galleryView.setThumbScrollPosition(0);
		}
	}
}