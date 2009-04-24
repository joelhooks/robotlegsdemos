package net.boyblack.robotlegs.demos.helloflex.controller.commands
{
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.*;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepModelCommand extends Command
	{

		override public function execute():void
		{
			injector.bindSingleton( UserProxy );
			injector.bindSingleton( MessageProxy );
		}

	}
}