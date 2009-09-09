package
{
	import flash.display.Sprite;
	import flash.system.Security;
	
	import org.robotlegs.demos.flashgooglemaps.FlashGoogleMapsContext;
	import org.robotlegs.adapters.SpringInjector;
	import org.robotlegs.adapters.SpringReflector;
	
	public class FlashGoogleMaps extends Sprite
	{
		private var _context:FlashGoogleMapsContext;
		
		public function FlashGoogleMaps()
		{
			Security.allowDomain("maps.googleapis.com");
			
			_context = new FlashGoogleMapsContext(this, new SpringInjector(), new SpringReflector());
		}
	}
}