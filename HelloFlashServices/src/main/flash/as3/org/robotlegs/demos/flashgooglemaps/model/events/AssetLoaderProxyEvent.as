package org.robotlegs.demos.flashgooglemaps.model.events
{
	import flash.events.Event;
	
	public class AssetLoaderProxyEvent extends Event
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const XML_CONTENT_LOADED:String = 'xmlContentLoaded';
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		private var _asset:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function AssetLoaderProxyEvent(type:String, asset:Object = null)
		{
			super(type);
			
			_asset = asset;
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get asset():Object
		{
			return _asset;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		override public function clone():Event
		{
			return new AssetLoaderProxyEvent(type, asset);
		}
	}
}