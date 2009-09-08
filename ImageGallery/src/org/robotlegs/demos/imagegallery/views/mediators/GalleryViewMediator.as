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
	import org.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
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
			addEventListenerTo( galleryView, GalleryImageEvent.SELECT_GALLERY_IMAGE, onImageSelected )
			addEventListenerTo( eventDispatcher, GalleryEvent.GALLERY_LOADED, onGalleryLoaded )
			addEventListenerTo( eventDispatcher, GallerySearchEvent.SEARCH, onSearch);
			
			dispatch( new GalleryEvent( GalleryEvent.LOAD_GALLERY ) );
		}
		
		protected function selectImage(image:GalleryImage):void
		{
			galleryView.imageSource = image.URL;
			dispatch(new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, image));
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