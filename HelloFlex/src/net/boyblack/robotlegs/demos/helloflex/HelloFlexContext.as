package net.boyblack.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;
	
	import net.boyblack.robotlegs.adapters.SmartyPantsInjector;
	import net.boyblack.robotlegs.adapters.SmartyPantsReflector;
	import net.boyblack.robotlegs.demos.helloflex.controller.commands.*;
	import net.boyblack.robotlegs.mvcs.Context;
	import net.boyblack.robotlegs.mvcs.ContextEvent;
	import net.expantra.smartypants.extra.NoSmartyPantsLogging;

	public class HelloFlexContext extends Context
	{

		public function HelloFlexContext( contextView:DisplayObjectContainer )
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