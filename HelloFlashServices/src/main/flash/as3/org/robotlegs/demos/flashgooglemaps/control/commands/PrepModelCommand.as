package org.robotlegs.demos.flashgooglemaps.control.commands
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.flashgooglemaps.model.proxies.AssetLoaderProxy;
	import org.robotlegs.demos.flashgooglemaps.model.proxies.ConfigProxy;
	import org.robotlegs.demos.flashgooglemaps.model.services.GeoCodingService;

	public class PrepModelCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function execute():void
		{
			injector.bindSingleton(AssetLoaderProxy);
			injector.bindSingleton(ConfigProxy);
			injector.bindSingleton(GeoCodingService);
		}
	}
}