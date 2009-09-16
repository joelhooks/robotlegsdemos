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
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryLabelMediator;
	import org.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import org.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import org.robotlegs.demos.imagegallery.views.components.GalleryView;
	import org.robotlegs.demos.imagegallery.views.mediators.GallerySearchMediator;
	import org.robotlegs.demos.imagegallery.views.mediators.GalleryViewMediator;
	
	import org.robotlegs.core.ICommand;
	import org.robotlegs.mvcs.Command;

	public class PrepViewCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			mediatorFactory.mapMediator( GalleryView, GalleryViewMediator );
			mediatorFactory.mapMediator( GallerySearch, GallerySearchMediator );
			mediatorFactory.mapMediator( GalleryLabel, GalleryLabelMediator );
		}
	}
}