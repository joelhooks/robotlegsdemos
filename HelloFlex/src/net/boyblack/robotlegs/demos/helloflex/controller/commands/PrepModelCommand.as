package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.*;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepModelCommand extends Command
	{

		override public function execute():void
		{
			injector.newRule().whenAskedFor( UserProxy ).useSingleton();
			injector.newRule().whenAskedFor( MessageProxy ).useSingleton();
		}

	}
}