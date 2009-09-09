package org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.base
{
	import org.robotlegs.demos.flashgooglemaps.model.vo.googlemaps.MapMarker;

	public class BaseMapMarkers
	{	
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _markers:Vector.<MapMarker>;
		
		//--------------------------------------------------------------------------
        //
        //  Initialization
        //
        //--------------------------------------------------------------------------	
		public function BaseMapMarkers()
		{
			_markers = new Vector.<MapMarker>();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function addMarker(marker:MapMarker):void
		{
			_markers.push(marker);
		}
		
		public function get markers():Vector.<MapMarker>
		{
			return _markers;
		}
	}
}