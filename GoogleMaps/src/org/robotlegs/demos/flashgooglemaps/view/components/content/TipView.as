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

package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * The implementation of a single tip view.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */
	[Embed(source='assets/swf/contentAssets.swf', symbol='TipView')]
	public class TipView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIP:String = "showTip";
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var tipText:TextField;
		public var active:MovieClip;
		
		private var _id:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TipView()
		{
			super();
		}
		
		public function main():void
		{
			initializeView();
			
			initializeBehaviour();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function setTipText(val:String):void
		{
			tipText.htmlText = val;
		}
		
		public function set id(val:uint):void
		{
			_id = val;
		}
		
		public function get id():uint
		{
			return _id;
		}
		
		public function resetView():void
		{
			active.alpha = 0;
			
			initializeBehaviour();
		}
		
		public function destroy():void
		{
			deinitializeBehaviour();
		}

		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleEvent(event:*):void
		{
			switch(event.type)
			{
				case MouseEvent.MOUSE_OVER:
					active.alpha = 1;
				break;
				case MouseEvent.MOUSE_OUT:
					active.alpha = 0;
				break;
				case MouseEvent.MOUSE_DOWN:
					deinitializeBehaviour();
					dispatchEvent(new Event(TipView.SHOW_TIP));
				break;
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function initializeView():void
		{
			active.alpha = 0;
			active.buttonMode = true;
			tipText.mouseEnabled = false;
		}

		private function initializeBehaviour():void
		{
			active.addEventListener(MouseEvent.MOUSE_OVER, handleEvent);
			active.addEventListener(MouseEvent.MOUSE_OUT, handleEvent);
			active.addEventListener(MouseEvent.MOUSE_DOWN, handleEvent);
		}
		
		private function deinitializeBehaviour():void
		{
			active.removeEventListener(MouseEvent.MOUSE_OVER, handleEvent);
			active.removeEventListener(MouseEvent.MOUSE_OUT, handleEvent);
			active.removeEventListener(MouseEvent.MOUSE_DOWN, handleEvent);
		}
	}
}