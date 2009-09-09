package org.robotlegs.demos.flashgooglemaps.control.commands
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.GoogleMapsView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.googlemaps.GoogleMapsMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.ContentMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.TabMediator;

	public class PrepViewCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function execute():void
		{
			mediatorFactory.mapMediator(GoogleMapsView, GoogleMapsMediator);
			mediatorFactory.mapMediator(ContentView, ContentMediator);
			mediatorFactory.mapMediator(TabView, TabMediator);
		}
	}
}