/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package com.joelhooks.robotlegs.demos.imagegallery.controllers
{
	import com.joelhooks.robotlegs.demos.imagegallery.views.mediators.GalleryLabelMediator;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryLabel;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GallerySearch;
	import com.joelhooks.robotlegs.demos.imagegallery.views.components.GalleryView;
	import com.joelhooks.robotlegs.demos.imagegallery.views.mediators.GallerySearchMediator;
	import com.joelhooks.robotlegs.demos.imagegallery.views.mediators.GalleryViewMediator;
	
	import net.boyblack.robotlegs.core.ICommand;
	import net.boyblack.robotlegs.mvcs.Command;

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