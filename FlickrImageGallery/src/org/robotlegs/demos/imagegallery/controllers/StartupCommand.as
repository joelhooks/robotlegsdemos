/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.controllers
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.imagegallery.remote.services.IGalleryImageService;
	import org.robotlegs.mvcs.Command;

	public class StartupCommand extends Command
	{
		[Inject]
		public var galleryService:IGalleryImageService;

		override public function execute():void
		{
			// Do some custom startup stuff here!
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}