package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.demos.helloflex.remote.services.*;
	import org.robotlegs.mvcs.Command;

	public class PrepServicesCommand extends Command
	{

		override public function execute():void
		{
			injector.bindSingletonOf( IAuthService, DummyAuthService );
		}

	}
}