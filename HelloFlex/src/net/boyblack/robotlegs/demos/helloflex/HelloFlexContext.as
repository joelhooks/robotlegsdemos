package net.boyblack.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;

	import net.boyblack.robotlegs.adapters.SmartyPantsInjector;
	import net.boyblack.robotlegs.adapters.SmartyPantsReflector;
	import net.boyblack.robotlegs.demos.helloflex.controller.commands.*;
	import net.boyblack.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import net.boyblack.robotlegs.mvcs.Context;

	public class HelloFlexContext extends Context
	{

		public function HelloFlexContext( contextView:DisplayObjectContainer )
		{
			super( contextView, new SmartyPantsInjector(), new SmartyPantsReflector() );
		}

		override public function startup():void
		{
			commandFactory.mapCommand( SystemEvent.STARTUP, PrepModelCommand, true );
			commandFactory.mapCommand( SystemEvent.STARTUP, PrepControllerCommand, true );
			commandFactory.mapCommand( SystemEvent.STARTUP, PrepServicesCommand, true );
			commandFactory.mapCommand( SystemEvent.STARTUP, PrepViewCommand, true );
			commandFactory.mapCommand( SystemEvent.STARTUP, StartupCommand, true );

			eventBroadcaster.dispatchEvent( new SystemEvent( SystemEvent.STARTUP ) );
		}

	}
}