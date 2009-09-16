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
	
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;
	
	import org.robotlegs.adapters.SmartyPantsInjector;
	import org.robotlegs.adapters.SmartyPantsReflector;
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
			super( contextView, new SmartyPantsInjector(), new SmartyPantsReflector() );
			// Keep SmartyPants quiet
			NoSmartyPantsLogging;
		}
	
		override public function startup():void
		{
			// Map our startup commands
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepModelCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepControllerCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepServicesCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepViewCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, StartupCommand, true );
			// And away we go!
			eventBroadcaster.dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );
		}
	}
}