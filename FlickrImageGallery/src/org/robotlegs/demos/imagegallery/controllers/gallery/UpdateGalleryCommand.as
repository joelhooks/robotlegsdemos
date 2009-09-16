package org.robotlegs.demos.imagegallery.controllers.gallery
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import org.robotlegs.mvcs.Command;

	public class UpdateGalleryCommand extends Command implements ICommand
	{
		[Inject]
		public var event:GalleryEvent;
		
		[Inject]
		public var galleryProxy:GalleryProxy;
		
		override public function execute():void
		{			
			this.galleryProxy.gallery = event.gallery;
		}
	}
}