package org.robotlegs.demos.acmewidgetfactory.shell.controller.commands
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.LoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellLoggerEvent;
	import org.robotlegs.mvcs.Command;
	
	public class CreateLoggerCommand extends Command
	{
		
		override public function execute():void
		{
			var logger:ILoggerModule;
			// bad: mustn't ref directly
			logger = new LoggerModule();
			dispatch(new ShellLoggerEvent(ShellLoggerEvent.CREATE_LOGGER_COMPLETE, logger));
		}
	}
}