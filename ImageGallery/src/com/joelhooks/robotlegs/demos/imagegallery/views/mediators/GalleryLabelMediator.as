package com.joelhooks.robotlegs.demos.imagegallery.views.mediators
{
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import com.joelhooks.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import net.boyblack.robotlegs.core.IMediator;
	import net.boyblack.robotlegs.mvcs.Mediator;

	public class GalleryLabelMediator extends Mediator implements IMediator
	{
		[Inject]
		public var galleryLabel:GalleryLabel;
		
		public function GalleryLabelMediator()
		{
			super();
		}
		
		override public function onRegisterComplete():void
		{
			addEventListenerTo( eventDispatcher, GallerySearchEvent.SEARCH, handleSearch );
			this.galleryLabel.setText("interestingness");
		}
		
		protected function handleSearch(event:GallerySearchEvent):void
		{
			this.galleryLabel.setText(event.searchTerm); 
		}
	}
}