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

	[Embed(source='../../../../../../../../assets/swf/contentAssets.swf', symbol='CustomInfoWindow')]
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