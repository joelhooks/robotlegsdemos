/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.remote.services
{
	import com.adobe.webapis.flickr.FlickrService;
	import com.adobe.webapis.flickr.Photo;
	import com.adobe.webapis.flickr.events.FlickrResultEvent;
	import com.adobe.webapis.flickr.methodgroups.Photos;
	import com.adobe.webapis.flickr.methodgroups.helpers.PhotoSearchParams;
	
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.models.vo.Gallery;
	import org.robotlegs.demos.imagegallery.models.vo.GalleryImage;
	import org.robotlegs.mvcs.Actor;

	public class FlickrImageService extends Actor implements IGalleryImageService
	{
		private var service:FlickrService;
		private var photos:Photos;
		
		protected static const FLICKR_API_KEY:String = "516ab798392cb79523691e6dd79005c2";
		
		public function FlickrImageService()
		{
			this.service = new FlickrService(FLICKR_API_KEY);
		}
		
		public function get searchAvailable():Boolean
		{
			return true;
		}
				
		public function loadGallery():void
		{
			service.addEventListener(FlickrResultEvent.INTERESTINGNESS_GET_LIST, handleSearchResult);
			service.interestingness.getList(null,"",20)
		}
		
		public function search(searchTerm:String):void
		{
			if(!this.photos)
				this.photos = new Photos(this.service);
			service.addEventListener(FlickrResultEvent.PHOTOS_SEARCH, handleSearchResult);
			var p:PhotoSearchParams = new PhotoSearchParams()
			p.text = searchTerm;
			p.per_page = 20;
			p.content_type = 1;
			p.media = "photo"
			p.sort = "date-posted-desc";
			this.photos.searchWithParamHelper(p);				
		}
		
		protected function handleSearchResult(event:FlickrResultEvent):void
		{
			this.processFlickrPhotoResults(event.data.photos.photos);
		}
		
		protected function processFlickrPhotoResults(results:Array):void
		{
			var gallery:Gallery = new Gallery();
						
			for each(var flickrPhoto:Photo in results)
			{
				var photo:GalleryImage = new GalleryImage()
				var baseURL:String = 'http://farm' + flickrPhoto.farmId + '.static.flickr.com/' + flickrPhoto.server + '/' + flickrPhoto.id + '_' + flickrPhoto.secret;
				photo.thumbURL = baseURL + '_s.jpg';
				photo.URL = baseURL + '.jpg';
				gallery.photos.addItem( photo );
			}
			
			dispatch(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
		}
		
	}
}