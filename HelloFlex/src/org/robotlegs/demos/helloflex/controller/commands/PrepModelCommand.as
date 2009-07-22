package org.robotlegs.demos.helloflex.controller.commands
{
	import org.robotlegs.demos.helloflex.model.proxies.*;
	import org.robotlegs.mvcs.Command;
	
	public class PrepModelCommand extends Command
	{
		
		override public function execute():void
		{
			injector.bindSingleton(UserProxy);
			injector.bindSingleton(MessageProxy);
		}
	
	}
}