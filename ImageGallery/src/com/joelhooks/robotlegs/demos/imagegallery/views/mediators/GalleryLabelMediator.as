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
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import com.joelhooks.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	
	import net.boyblack.robotlegs.core.IMediator;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

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