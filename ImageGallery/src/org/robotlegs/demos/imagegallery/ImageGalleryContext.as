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
	import org.robotlegs.demos.imagegallery.controllers.PrepModelCommand;
	import org.robotlegs.demos.imagegallery.controllers.PrepServicesCommand;
	import org.robotlegs.demos.imagegallery.controllers.PrepViewCommand;
	import org.robotlegs.demos.imagegallery.controllers.StartupCommand;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SmartyPantsInjector;
	import org.robotlegs.adapters.SmartyPantsReflector;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;

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
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepServicesCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, PrepViewCommand, true );
			commandFactory.mapCommand( ContextEvent.STARTUP, StartupCommand, true );
			// And away we go!
			eventBroadcaster.dispatchEvent( new ContextEvent( ContextEvent.STARTUP ) );
		}
	}
}