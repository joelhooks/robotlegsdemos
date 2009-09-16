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
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.StyleSheet;
	import flash.events.TextEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	/**
	 * The implementation of the plain text view. Displays some of the content from the xml.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	[Embed(source='assets/swf/contentAssets.swf', symbol='PlainTextView')]
	public class PlainTextView extends MovieClip
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIPS:String = "showTips";
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var contentWindow:MovieClip;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function PlainTextView()
		{
			super();
		}
		
		public function main():void
		{
			initializeView();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function setContent(val:String):void
		{
			contentWindow.contentField.htmlText = val;
		}
		
		public function destroy():void
		{
			contentWindow.contentField.removeEventListener(TextEvent.LINK, handleEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleEvent(event:TextEvent):void
		{
			dispatchEvent(new Event(event.text));
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function initializeView():void
		{
			x = 30;

            contentWindow.contentField.styleSheet = initializeStyles();
            contentWindow.contentField.autoSize = TextFieldAutoSize.LEFT;
            contentWindow.contentField.addEventListener(TextEvent.LINK, handleEvent);
		}
	
		private function initializeStyles():StyleSheet
		{
			var style:StyleSheet = new StyleSheet();
	
	        var quote:Object = new Object();
	        quote.fontSize = "21";
	        quote.textAlign = "center";
	        
	        var mbold:Object = new Object();
	        mbold.fontFamily = "Myriad Pro Semibold";
	        
	        var link:Object = new Object();
	        link.fontSize = "24";
	        link.textAlign = "center";
	        link.color = "#b30d0d";
	        link.textDecoration = "underline";
	
			style.setStyle(".quote", quote);
			style.setStyle(".mbold", mbold);
			style.setStyle(".link", link);
			
			return style;
		}
	}
}