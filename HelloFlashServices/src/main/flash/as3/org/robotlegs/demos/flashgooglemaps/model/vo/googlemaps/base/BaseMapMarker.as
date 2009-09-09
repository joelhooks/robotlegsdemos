package org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.base
{
	import com.google.maps.LatLng;

	import org.robotlegs.demos.flashgooglemaps.view.components.googlemaps.SmartInfoWindow;

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