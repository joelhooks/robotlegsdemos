package com.joelhooks.robotlegs.demos.imagegallery.views.mediators
{
	import com.joelhooks.robotlegs.demos.imagegallery.remote.services.IGalleryImageServiceDelegate;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import com.joelhooks.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import net.boyblack.robotlegs.core.IMediator;
	import net.boyblack.robotlegs.mvcs.Mediator;

	public class GallerySearchMediator extends Mediator implements IMediator
	{
		[Inject]
		public var gallerySearch:GallerySearch;

		[Inject]
		public var imageService:IGalleryImageServiceDelegate;
				
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