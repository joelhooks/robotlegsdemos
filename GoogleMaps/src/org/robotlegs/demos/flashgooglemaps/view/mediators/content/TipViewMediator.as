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
	import org.robotlegs.demos.flashgooglemaps.view.components.content.TipView;
	import org.robotlegs.demos.flashgooglemaps.view.events.TipViewEvent;

	import flash.events.Event;
	
	/**
	 * TipViewMediator. Note the way you declare a dependency and from
	 * that point on use the instance in your code.
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */
	public class TipViewMediator extends Mediator
	{
		[Inject]
		public var view:TipView;
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
		public function TipViewMediator()
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
			
			// you could also use:
			// eventMap.mapListener(view, MouseEvent.MOUSE_DOWN, handleShowTip);
			eventMap.mapListener(view, TipView.SHOW_TIP, handleShowTip);
			eventMap.mapListener(eventDispatcher, TipViewEvent.SHOW_TIP, handleShowTipReset);
		}
		
		override public function onRemove():void
		{
			view.destroy();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleShowTip(event:Event):void
		{
			dispatch(new TipViewEvent(TipViewEvent.SHOW_TIP, view.id));
		}
		
		private function handleShowTipReset(event:TipViewEvent):void
		{
			if(view.id != event.id) view.resetView();
		}
	}
}