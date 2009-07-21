package org.robotlegs.demos.imagegallery.controllers.gallery
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	import org.robotlegs.mvcs.Command;

	public class SetSelectedImageCommand extends Command implements ICommand
	{
		[Inject]
		public var event:GalleryImageEvent;
		
		[Inject]
		public var proxy:GalleryProxy;
		
		override public function execute():void
		{
			if(event.image)
				proxy.setSelectedImage(event.image);
		}
	}
}