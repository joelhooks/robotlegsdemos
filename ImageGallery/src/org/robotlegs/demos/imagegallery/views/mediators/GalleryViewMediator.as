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
	import org.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.components.GalleryView;
	
	import org.robotlegs.mvcs.FlexMediator;

	public class GalleryViewMediator extends FlexMediator
	{
		[Inject]
		public var galleryView:GalleryView;
		
		[Inject]
		public var galleryProxy:GalleryProxy;
		
		[Inject]
		public var imageService:IGalleryImageService;
		
		public function GalleryViewMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			addEventListenerTo( galleryView, GalleryImageEvent.SELECT_GALLERY_IMAGE, onImageSelected )
			addEventListenerTo( eventDispatcher, GalleryEvent.GALLERY_LOADED, onGalleryLoaded )
			this.imageService.loadGallery();
		}
		
		protected function selectImage(image:GalleryImage):void
		{
			galleryView.image.source = image.URL;
			galleryProxy.setSelectedImage(image);		
		}
		
		protected function onGalleryLoaded(event:GalleryEvent):void
		{
			galleryView.dgThumbnails.dataProvider = galleryProxy.gallery.photos;
			selectImage( galleryProxy.gallery.photos[0] as GalleryImage );
		}
		
		protected function onImageSelected(event:GalleryImageEvent):void
		{
			this.selectImage(event.image);
		}
	}
}