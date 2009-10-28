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

package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Security;
	
	import org.robotlegs.demos.flashgooglemaps.FlashGoogleMapsContext;
	
	/**
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 * The project is a FlashBuilder AS3-project using SDK4.0.0 build 7219. 
	 * It is set to build in /web/assets/swf/ and opens the index.html in /web 
	 * if you debug the project. The index.html embeds a loader.swf and it loads 
	 * the swf (FlashGoogleMaps.swf) we compile with FlashBuilder. The View (component) 
	 * classes in the code embed graphical assets (movieclips) from fla files (Flash CS4). 
	 * These are set to publish in src/main/flash/assets/swf/. 
	 * If you change things in the fla's, compile in the Flash IDE and debug the 
	 * project in FlashBuilder to see the changes. The Googlemap uses a custom marker. 
	 * Its View class embeds a .png that resides in src/main/flash/assets/bitmaps/
	 * 
	 * The directory structure is pretty much how I do my projects. If you want
	 * to read more on this workflow and embedding assets, you can visit my blog 
	 * on http://blog.peterlorent.nl and read the articles in the category Flash Workflow.
	 * 
	 * This class serves as the Document Class for the project and as such as
	 * the 'root' Sprite. We provide this Sprite to the framework so it can detect
	 * any changes to its Display List.
	 *	
	 * Note: Eventually I took the View-Controller-Model, Model updates View route to load 
	 * the xml and to get the result from the Googlemaps API. An alternative is to declare 
	 * the Proxy and Service as a dependency in the Mediator(s) and take the View queries Model,
	 * Model updates View approach.
	 * 
	 */		
	public class FlashGoogleMaps extends Sprite
	{
		// hold on to this
		private var _context:FlashGoogleMapsContext;
		
		public static const GOOGLE_MAPS_API_KEY:String = "ABQIAAAAO-cCleAenkHS3l5YIe2rfxSt3J1WxB__3gt1bNGcz4st1p409RRCt9eMECH2W2XImEESSkQKpJMumg";
		public static const GOOGLE_MAPS_URL:String = "http://robotlegs.org";
		
		public function FlashGoogleMaps()
		{
			super();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			Security.allowDomain("maps.googleapis.com");
			
			// initialize the framework
			_context = new FlashGoogleMapsContext(this);
		}
	}
}