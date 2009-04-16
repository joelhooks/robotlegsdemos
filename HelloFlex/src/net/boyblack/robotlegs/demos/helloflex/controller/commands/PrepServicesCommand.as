package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.remote.services.*;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepServicesCommand extends Command
	{

		override public function execute():void
		{
			injector.newRule().whenAskedFor( IAuthService ).useSingletonOf( DummyAuthService );
		}

	}
}