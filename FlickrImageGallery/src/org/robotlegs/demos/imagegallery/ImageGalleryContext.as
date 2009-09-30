/*
   Inversion of Control/Dependency Injection Using Robotlegs
   Image Gallery

   Any portion of this demonstration may be reused for any purpose where not
   licensed by another party restricting such use. Please leave the credits intact.

   Joel Hooks
   http://joelhooks.com
   joelhooks@gmail.com
 */
package org.robotlegs.demos.imagegallery
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.imagegallery.controllers.startup.PrepControllerCommand;
	import org.robotlegs.demos.imagegallery.controllers.startup.PrepModelCommand;
	import org.robotlegs.demos.imagegallery.controllers.startup.PrepServicesCommand;
	import org.robotlegs.demos.imagegallery.controllers.startup.PrepViewCommand;
	import org.robotlegs.demos.imagegallery.controllers.startup.StartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class ImageGalleryContext extends Context
	{
		public function ImageGalleryContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Map our startup commands
			commandMap.mapEvent(ContextEvent.STARTUP, PrepModelCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepControllerCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepServicesCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, PrepViewCommand, true);
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, true);
			// And away we go!
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}