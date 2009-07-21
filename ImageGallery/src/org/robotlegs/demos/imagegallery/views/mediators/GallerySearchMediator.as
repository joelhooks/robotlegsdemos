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
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import org.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.FlexMediator;

	public class GallerySearchMediator extends FlexMediator implements IMediator
	{
		[Inject]
		public var gallerySearch:GallerySearch;

		public function GallerySearchMediator()
		{
		}
		
		override public function onRegister():void
		{
			this.gallerySearch.addEventListener( GallerySearchEvent.SEARCH, handleSearch);
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			dispatch( event );
		}
	}
}