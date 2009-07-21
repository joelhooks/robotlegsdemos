package org.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.adapters.SpringInjector;
	import org.robotlegs.adapters.SpringReflector;
	import org.robotlegs.demos.helloflex.controller.commands.*;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;

	public class HelloFlexContext extends Context
	{

		public function HelloFlexContext( contextView:DisplayObjectContainer )
		{
			super( contextView, new SpringInjector(), new SpringReflector() );
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