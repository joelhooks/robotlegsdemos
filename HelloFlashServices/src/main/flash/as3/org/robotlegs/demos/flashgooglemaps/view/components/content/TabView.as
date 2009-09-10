package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	import caurina.transitions.Tweener;
	import caurina.transitions.Equations;

	import org.robotlegs.demos.flashgooglemaps.view.events.ContentChangeEvent;

	[Embed(source='../../../../../../../../assets/swf/tabNavAssets.swf', symbol='TabView')]
	public class TabView extends MovieClip
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const CONTENT_HOW:uint = 0;
		public static const CONTENT_TIPS:uint = 1;
		public static const CONTENT_HOW2:uint = 2;
		public static const CONTENT_HOW3:uint = 3;
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		public var hoe:MovieClip;
		public var tips:MovieClip;
		public var spelregels:MovieClip;
		public var actievoorwaarden:MovieClip;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TabView()
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
    	public function show():void
    	{
    		Tweener.addTween(this, {y:130, alpha:1, transition:Equations.easeOutExpo, time:.8});
    	}
    	
    	public function hide():void
    	{
    		visible = false;
    	}
    	
    	public function goToTab(frame:Number):void
    	{
    		gotoAndStop(frame);
    	}
    	
    	//--------------------------------------------------------------------------
    	//
    	//  Eventhandling
    	//
    	//--------------------------------------------------------------------------
    	private function handleEvent(event:*):void
    	{
			switch(event.type)
			{
				case MouseEvent.MOUSE_UP:
					switch(event.target)
					{
						case hoe:
							gotoAndStop(1);
							dispatchEvent(new ContentChangeEvent(ContentChangeEvent.CONTENT_CHANGE, TabView.CONTENT_HOW));
						break;
						case tips:
							gotoAndStop(2);
							dispatchEvent(new ContentChangeEvent(ContentChangeEvent.CONTENT_CHANGE, TabView.CONTENT_TIPS));
						break;
						case spelregels:
							gotoAndStop(3);
							dispatchEvent(new ContentChangeEvent(ContentChangeEvent.CONTENT_CHANGE, TabView.CONTENT_HOW2));
						break;
						case actievoorwaarden:
							gotoAndStop(4);
							dispatchEvent(new ContentChangeEvent(ContentChangeEvent.CONTENT_CHANGE, TabView.CONTENT_HOW3));
						break;
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
    		alpha = 0;
    		
    		gotoAndStop(1);
    		x = 390;
    		y = 1480;
    		
    		hoe.buttonMode = true;
    		tips.buttonMode = true;
			spelregels.buttonMode = true;
			actievoorwaarden.buttonMode = true;
		}

		private function initializeBehaviour():void
    	{
    		hoe.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
			tips.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
			spelregels.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
			actievoorwaarden.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
		}
	}
}