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

package org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.base
{
	import com.google.maps.LatLng;

	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.SmartInfoWindow;
	
	/**
	 * Base implementation of a MapMarker.
	 *  
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	public class BaseMapMarker
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _latlng:LatLng;
		private var _headline:String;
		private var _body:String;
		private var _city:String;
		private var _address:String;
		private var _visual:String;
		private var _smartInfoWindow:SmartInfoWindow = new SmartInfoWindow();
		
		//--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------			
		public function BaseMapMarker()
		{
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function set latlng(val:LatLng):void
		{
			_latlng = val;
		}
		
		public function get latlng():LatLng
		{
			return _latlng;
		}
		
		public function set city(val:String):void
		{
			_city = val;
		}
		
		public function get city():String
		{
			return _city;
		}
		
		public function set address(val:String):void
		{
			_address = val;
		}
		
		public function get address():String
		{
			return _address;
		}
		
		public function set smartInfoWindow(val:SmartInfoWindow):void
		{
			_smartInfoWindow = val;
		}
		
		public function get smartInfoWindow():SmartInfoWindow
		{
			return _smartInfoWindow;
		}
	}
}