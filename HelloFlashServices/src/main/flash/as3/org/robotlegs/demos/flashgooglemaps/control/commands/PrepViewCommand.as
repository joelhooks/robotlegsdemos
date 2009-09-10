package org.robotlegs.demos.flashgooglemaps.control.commands
{
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.GoogleMapsView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.googlemaps.GoogleMapsMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.ContentViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.TabViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.PlainTextView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.PlainTextViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.TipViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TipView;

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
			mediatorFactory.mapMediator(ContentView, ContentViewMediator);
			mediatorFactory.mapMediator(TabView, TabViewMediator);
			mediatorFactory.mapMediator(PlainTextView, PlainTextViewMediator);
			mediatorFactory.mapMediator(TipView, TipViewMediator);
		}
	}
}