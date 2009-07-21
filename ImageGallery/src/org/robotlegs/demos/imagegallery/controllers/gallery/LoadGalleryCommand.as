package org.robotlegs.demos.imagegallery.controllers.gallery
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.mvcs.Command;

	public class LoadGalleryCommand extends Command implements ICommand
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