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

package org.robotlegs.demos.flashgooglemaps.view.components.googlemaps
{
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.text.TextField;
	import flash.geom.Rectangle;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	import com.google.maps.overlays.Marker;
	
	/**
	 * The implementation of the SmartInfoWindow lay over view.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */
	[Embed(source='assets/swf/contentAssets.swf', symbol='CustomInfoWindow')]
	public class SmartInfoWindow extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const RESET_MAP:String = "resetMap";
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var closeInfoWindow:MovieClip;
		public var photo:MovieClip;
		public var headline:TextField;
		public var body:TextField;
		
		private var _loader:Loader;
		private var _marker:Marker;
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function SmartInfoWindow()
		{
			super();
			
			initializeView();
			
			initializeBehaviour();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get closeButtonRect():Rectangle
		{
      		return new Rectangle(closeInfoWindow.x, closeInfoWindow.y, closeInfoWindow.width, closeInfoWindow.height);
    	}
    	
    	public function show():void
    	{
    		visible = true;
    	}
    	
    	public function hide():void
    	{
    		visible = false;
  			marker.visible = true;
    	}
    	
    	public function setHeadline(val:String):void
    	{
    		headline.text = val;
    	}
    	
    	public function setBody(val:String):void
    	{
    		body.text = val;
    	}
    	
    	public function setVisual(val:String):void
    	{
    		loadVisual(val);
    	}
    	
    	public function set marker(val:Marker):void
    	{
    		_marker = val;
    	}
    	
    	public function get marker():Marker
    	{
    		return _marker;
    	}
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Eventhandling
    	//
    	//--------------------------------------------------------------------------
    	private function showVisual(event:Event):void
    	{
    		photo.visible = true;
    		_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, showVisual);
    		_loader = null;
    	}
    	
    	private function handleEvent(event:*):void
    	{
    		switch(event.type)
    		{
    			case MouseEvent.MOUSE_UP:
    				if(event.target == closeInfoWindow)
    				{
    					hide();
    					dispatchEvent(new Event(SmartInfoWindow.RESET_MAP));
					}
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
    		x = 81;
    		y = 25;
    		
    		photo.visible = false;
    		visible = false;
			closeInfoWindow.buttonMode = true;
		}
    	
    	private function initializeBehaviour():void
    	{
			closeInfoWindow.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
		}
    	
    	private function loadVisual(url:String):void
    	{
    		_loader = new Loader();
			photo.addChild(_loader);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, showVisual);
			_loader.load(new URLRequest("assets/img/" + url));
    	}
	}
}