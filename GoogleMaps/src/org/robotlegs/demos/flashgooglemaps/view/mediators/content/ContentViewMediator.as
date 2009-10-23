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

package org.robotlegs.demos.flashgooglemaps.view.mediators.content
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.demos.flashgooglemaps.model.events.AssetLoaderProxyEvent;
	import org.robotlegs.demos.flashgooglemaps.view.components.content.ContentView;
	import org.robotlegs.demos.flashgooglemaps.events.SystemEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;
	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;

	import flash.events.Event;
	
	/**
	 * ContentViewMediator. Note the way you declare a dependency and from
	 * that point on use the instance in your code.
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */
	public class ContentViewMediator extends Mediator
	{	
		[Inject]
		public var view:ContentView;
		
		private var _xml:XML;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		public function ContentViewMediator()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{
			view.main();
			
			eventMap.mapListener(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
			eventMap.mapListener(eventDispatcher, SystemEvent.GOOGLE_MAP_ON_STAGE, handleShow);
			eventMap.mapListener(eventDispatcher, ContentChangeEvent.CONTENT_CHANGE, handleContentChange);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleXMLContentLoaded(event:AssetLoaderProxyEvent):void
		{
			_xml = event.xml;
			
			view.showPlainTextView(_xml..content[0]);
			
			eventMap.unmapListener(eventDispatcher, AssetLoaderProxyEvent.XML_CONTENT_LOADED, handleXMLContentLoaded);
		}
		
		private function handleShow(event:SystemEvent):void
		{
			view.show();
			
			eventMap.unmapListener(eventDispatcher, SystemEvent.GOOGLE_MAP_ON_STAGE, handleShow);
		}
		
		private function handleContentChange(event:ContentChangeEvent):void
		{
			if(event.id == 1)
				view.showTipTextView(_xml..content[1]);
			else
				view.showPlainTextView(_xml..content[event.id]);
		}
	}
}