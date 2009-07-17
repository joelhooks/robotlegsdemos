/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package com.joelhooks.robotlegs.demos.imagegallery
{
	import com.joelhooks.robotlegs.demos.imagegallery.controllers.PrepModelCommand;
	import com.joelhooks.robotlegs.demos.imagegallery.controllers.PrepServicesCommand;
	import com.joelhooks.robotlegs.demos.imagegallery.controllers.PrepViewCommand;
	import com.joelhooks.robotlegs.demos.imagegallery.controllers.StartupCommand;
	
	import flash.display.DisplayObjectContainer;
	
	import net.boyblack.robotlegs.adapters.SmartyPantsInjector;
	import net.boyblack.robotlegs.adapters.SmartyPantsReflector;
	import net.boyblack.robotlegs.mvcs.Context;
	import net.boyblack.robotlegs.mvcs.ContextEvent;
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