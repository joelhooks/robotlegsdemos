/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package com.joelhooks.robotlegs.demos.imagegallery.remote.services
{
	import com.adobe.webapis.flickr.FlickrService;
	import com.adobe.webapis.flickr.Photo;
	import com.adobe.webapis.flickr.events.FlickrResultEvent;
	import com.adobe.webapis.flickr.methodgroups.Photos;
	import com.joelhooks.robotlegs.demos.imagegallery.events.GalleryEvent;
	import com.joelhooks.robotlegs.demos.imagegallery.events.GalleryImageServiceEvent;
	import com.joelhooks.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import com.joelhooks.robotlegs.demos.imagegallery.models.vo.Gallery;
	import com.joelhooks.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	
	import mx.collections.ArrayCollection;
	
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class FlickrImageServiceDelegate extends FlexMediator implements IGalleryImageServiceDelegate
	{
		[Inject]
		public var galleryProxy:GalleryProxy;
		
		private var service:FlickrService;
		private var photos:Photos;
		
		protected static const FLICKR_API_KEY:String = "YOUR_API_KEY";
		
		public function FlickrImageServiceDelegate()
		{
			this.service = new FlickrService(FLICKR_API_KEY);
		}

		override public function onRegisterComplete():void
		{
			dispatch( new GalleryImageServiceEvent(GalleryImageServiceEvent.SERVICE_READY) );
		}
				
		public function loadGallery():void
		{
			service.addEventListener(FlickrResultEvent.INTERESTINGNESS_GET_LIST, handleSearchResult);
			service.interestingness.getList(null,"",20)
		}
		
		protected function handleSearchResult(event:FlickrResultEvent):void
		{
			this.processFlickrPhotoResults(event.data.photos.photos);
		}
		
		protected function processFlickrPhotoResults(results:Array):void
		{
			var gallery:Gallery = new Gallery();
			gallery.photos = new ArrayCollection();
			for each(var flickrPhoto:Photo in results)
			{
				var photo:GalleryImage = new GalleryImage()
				var baseURL:String = 'http://farm' + flickrPhoto.farmId + '.static.flickr.com/' + flickrPhoto.server + '/' + flickrPhoto.id + '_' + flickrPhoto.secret;
				photo.thumbURL = baseURL + '_s.jpg';
				photo.URL = baseURL + '.jpg';
				gallery.photos.addItem( photo );
			}
			this.galleryProxy.gallery = gallery;
		}
	}
}