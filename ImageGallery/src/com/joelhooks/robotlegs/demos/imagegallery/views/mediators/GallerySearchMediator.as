/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package com.joelhooks.robotlegs.demos.imagegallery.views.mediators
{
	import com.joelhooks.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import com.joelhooks.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import net.boyblack.robotlegs.core.IMediator;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class GallerySearchMediator extends FlexMediator implements IMediator
	{
		[Inject]
		public var gallerySearch:GallerySearch;

		[Inject]
		public var imageService:IGalleryImageService;
				
		public function GallerySearchMediator()
		{
		}
		
		override public function onRegisterComplete():void
		{
			this.gallerySearch.addEventListener( GallerySearchEvent.SEARCH, handleSearch);
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			imageService.search(event.searchTerm);
			dispatch( event );
		}
	}
}