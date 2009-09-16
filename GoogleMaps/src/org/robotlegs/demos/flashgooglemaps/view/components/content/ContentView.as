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
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	/**
	 * The implementation of the main content view.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	[Embed(source='assets/swf/contentAssets.swf', symbol='ContentView')]
	public class ContentView extends Sprite
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
		public var link_github:MovieClip;
		public var contentHolder:MovieClip;
		public var placeHolderScroller:MovieClip;
		
		private var _currentView:MovieClip;
		private var _tips:Array = [];
		private var _scroller:CustomScrollbar;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------	
		public function ContentView()
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
    	public function show():void
    	{
    		Tweener.addTween(this, {y:150, alpha:1, transition:Equations.easeOutExpo, time:.8});
    	}
    	
    	public function hide():void
    	{
    		visible = false;
    	}
    	
    	public function showPlainTextView(val:String):void
    	{
			resetView();
			
			var view:PlainTextView = new PlainTextView();
			contentHolder.addChild(view);
			view.setContent(val);
			_currentView = view;
			
			_scroller.init(contentHolder, Equations.easeOutExpo, .5, false, 1);
		}
		
		public function showTipTextView(tips:XML):void
		{
			resetView();
			
			parseTips(tips);
		}
		
		public function resetView():void
		{	
			if(_currentView != null)
			{
				contentHolder.removeChild(_currentView);
				_scroller.reset();
				_currentView = null;	
			}
			
			if(_tips.length > 0)
			{
				var i:uint;
				
				for(i = 0; i < _tips.length; i++)
				{
					contentHolder.removeChild(_tips[i]);
				}
				
				_tips = [];
				_scroller.reset();
			}	
		}

		//--------------------------------------------------------------------------
    	//
    	//  Eventhandling
    	//
    	//--------------------------------------------------------------------------
    	private function handleEvent(event:*):void
    	{
	    	if(event.target == link_github) openExternalURL("http://wiki.github.com/darscan/robotlegs");
    	}
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Methods
    	//
    	//--------------------------------------------------------------------------
    	private function initializeView():void
    	{
    		alpha = 0;
    		
    		x = 390;
    		y = 1500;
    		
			link_github.buttonMode = true;
			
			_scroller = new CustomScrollbar();
			_scroller.x = placeHolderScroller.x;
			_scroller.y = placeHolderScroller.y;
			addChild(_scroller);
			
			placeHolderScroller.visible = false;
		}

		private function initializeBehaviour():void
    	{
			link_github.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
		}
		
		private function openExternalURL(url:String):void
		{
			var request:URLRequest = new URLRequest();
			request.url = url;
			navigateToURL(request, "_blank");
		}
		
		private function parseTips(tips:XML):void
		{
			var mapTips:XMLList = tips..tip;
			var tipsCount:uint = mapTips.length();
			
			if(tipsCount > 0)
			{
				var yVal:uint = 0;
				var i:uint = 0;
				
				for(i = 0; i < tipsCount; i++)
				{
					var tipXml:XML = mapTips[i];
					var tipText:String = tipXml.@text;
					var file:String = tipXml.@file;
					
					var tip:TipView = new TipView();
					tip.setTipText(tipText);
					tip.id = i;
					tip.y = yVal;
					contentHolder.addChild(tip);
					_tips.push(tip);
					yVal += 73;
				}
			}
		}
	}
}