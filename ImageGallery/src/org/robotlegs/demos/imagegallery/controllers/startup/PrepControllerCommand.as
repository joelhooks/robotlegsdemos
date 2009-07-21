/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.controllers.startup
{
	import org.robotlegs.core.ICommand;
	import org.robotlegs.demos.imagegallery.controllers.gallery.LoadGalleryCommand;
	import org.robotlegs.demos.imagegallery.controllers.gallery.LoadSearchGalleryCommand;
	import org.robotlegs.demos.imagegallery.controllers.gallery.SetSelectedImageCommand;
	import org.robotlegs.demos.imagegallery.controllers.gallery.UpdateGalleryCommand;
	import org.robotlegs.demos.imagegallery.events.GalleryEvent;
	import org.robotlegs.demos.imagegallery.events.GalleryImageEvent;
	import org.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	import org.robotlegs.mvcs.Command;

	public class PrepControllerCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			commandFactory.mapCommand( GalleryEvent.GALLERY_LOADED, UpdateGalleryCommand );
			commandFactory.mapCommand( GalleryImageEvent.SELECT_GALLERY_IMAGE, SetSelectedImageCommand );
			commandFactory.mapCommand( GalleryEvent.LOAD_GALLERY, LoadGalleryCommand );
			commandFactory.mapCommand( GallerySearchEvent.SEARCH, LoadSearchGalleryCommand );
		}
	}
}