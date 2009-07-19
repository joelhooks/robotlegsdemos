package com.joelhooks.robotlegs.demos.imagegallery.views.mediators
{
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import com.joelhooks.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.FlexMediator;

	public class GalleryLabelMediator extends FlexMediator implements IMediator
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