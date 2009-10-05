/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package org.robotlegs.demos.flashgooglemaps.control.commands
{
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.PlainTextView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TabView;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TipView;
	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.GoogleMapsView;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.ContentViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.PlainTextViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.TabViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.content.TipViewMediator;
	import org.robotlegs.demos.flashgooglemaps.view.mediators.googlemaps.GoogleMapsMediator;
	import org.robotlegs.mvcs.Command;
	
	/**
	 *
	 * @author Peter Lorent peter.lorent@gmail.com
	 *
	 */
	public class PrepViewCommand extends Command
	{
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Tell RobotLegs which Mediator to create when we drop an instance or
		 * instances of our view components on the stage. RobotLegs will detect
		 * this and automatically create the Mediator. And if we remove the view
		 * component, it will also remove the Mediator for us. Again, just mapping
		 * the view components to mediators doesn't start any action on the stage.
		 * Only if you drop one of your view components on the stage, that is when
		 * RobotLegs does the magic!
		 *
		 */
		override public function execute():void
		{
			mediatorMap.mapView(GoogleMapsView, GoogleMapsMediator);
			mediatorMap.mapView(ContentView, ContentViewMediator);
			mediatorMap.mapView(TabView, TabViewMediator);
			mediatorMap.mapView(PlainTextView, PlainTextViewMediator);
			mediatorMap.mapView(TipView, TipViewMediator);
		}
	}
}