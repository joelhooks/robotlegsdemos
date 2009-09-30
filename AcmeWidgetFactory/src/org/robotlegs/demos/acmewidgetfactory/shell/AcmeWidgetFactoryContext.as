package org.robotlegs.demos.acmewidgetfactory.shell
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.commands.ShellStartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class AcmeWidgetFactoryContext extends Context
	{
		public function AcmeWidgetFactoryContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			// Map our Startup Command
			commandMap.mapEvent(ContextEvent.STARTUP, ShellStartupCommand, true);
			// And away we go!
			super.startup();
		}
	
	}
}