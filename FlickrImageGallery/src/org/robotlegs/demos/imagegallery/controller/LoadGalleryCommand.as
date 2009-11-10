package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.demos.imagegallery.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Command;

	public class LoadGalleryCommand extends Command
	{
		[Inject]
		public var event:GalleryEvent;
		
		[Inject]
		public var service:IGalleryImageService;
				
		override public function execute():void
		{
			service.loadGallery();
		}
	}
}