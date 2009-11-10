package org.robotlegs.demos.imagegallery.controller
{
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.mvcs.Command;

	public class UpdateGalleryCommand extends Command
	{
		[Inject]
		public var event:GalleryEvent;
		
		[Inject]
		public var galleryModel:GalleryModel;
		
		override public function execute():void
		{			
			this.galleryModel.gallery = event.gallery;
		}
	}
}