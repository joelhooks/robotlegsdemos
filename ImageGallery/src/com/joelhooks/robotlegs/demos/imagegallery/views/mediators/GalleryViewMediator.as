package com.joelhooks.robotlegs.demos.imagegallery.views.mediators
{
	import com.joelhooks.robotlegs.demos.imagegallery.events.GalleryEvent;
	import com.joelhooks.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import com.joelhooks.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import com.joelhooks.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import com.joelhooks.robotlegs.demos.imagegallery.remote.services.IGalleryImageServiceDelegate;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryView;
	
	import net.boyblack.robotlegs.mvcs.Mediator;

	public class GalleryViewMediator extends Mediator
	{
		[Inject]
		public var galleryView:GalleryView;
		
		[Inject]
		public var galleryProxy:GalleryProxy;
		
		[Inject]
		public var imageService:IGalleryImageServiceDelegate;
		
		private var selectedImage:GalleryImage;
		
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
			this.selectedImage =image;
			galleryView.image.source = this.selectedImage.URL;	
			galleryProxy.setSelectedImage(image);		
		}
		
		protected function onGalleryLoaded(event:GalleryEvent):void
		{
			galleryView.dgThumbnails.dataProvider = galleryProxy.gallery.photos;
			this.selectImage( galleryProxy.gallery.photos[0] as GalleryImage );
		}
		
		protected function onImageSelected(event:GalleryImageEvent):void
		{
			this.selectImage(event.image);
		}
	}
}