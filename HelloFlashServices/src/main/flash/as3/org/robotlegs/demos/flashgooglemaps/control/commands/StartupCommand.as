package org.robotlegs.demos.flashgooglemaps.control.commands
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.GoogleMapsView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;

	public class StartupCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function execute():void
		{
			contextView.addChild(new GoogleMapsView());
			contextView.addChild(new ContentView());
			contextView.addChild(new TabView());
		}
	}
}