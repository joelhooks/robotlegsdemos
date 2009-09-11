package org.robotlegs.demos.flashgooglemaps
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.mvcs.ContextEvent;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepModelCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepViewCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.StartupCommand;

	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.impl.DefaultLogger;

	public class FlashGoogleMapsContext extends Context
	{
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function FlashGoogleMapsContext(contextView:DisplayObjectContainer, injector:IInjector, reflector:IReflector, autoStartup:Boolean = true)
		{
			super(contextView, injector, reflector, autoStartup);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function startup():void
		{
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepModelCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepViewCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, StartupCommand);
			
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		override protected function createLogger():ILogger
		{
			return new DefaultLogger('FlashGoogleMapsContext');
		}
	}
}