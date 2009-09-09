package org.robotlegs.demos.flashgooglemaps.view.components.googlemaps
{
	import flash.display.Sprite;
	
	public class CustomMarkerIcon extends Sprite
	{
		[Embed('../../../../../../../../assets/bitmaps/doticon.png')]
		private var DotIcon:Class;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function CustomMarkerIcon()
		{
			super();
			
			addChild(new DotIcon());
		    cacheAsBitmap = true;
		}
	}
}