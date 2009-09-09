package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.events.Event;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	import caurina.transitions.Equations;
	import caurina.transitions.Tweener;
	
	[Embed(source='../../../../../../../../assets/swf/contentAssets.swf', symbol='ContentView')]
	public class ContentView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Class properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIPS:String = "showTips";
		public static const SHOW_TIP_ON_MAP:String = "showTipOnMap";
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var link_github:MovieClip;
		public var contentHolder:MovieClip;
		public var placeHolderScroller:MovieClip;
		
		private var _currentView:MovieClip;
		private var _tips:Array = [];
		private var _scroller:CustomScrollbar;
		private var _activeTip:TipView;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function ContentView()
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
    		Tweener.addTween(this, {y:150, alpha:1, transition:Equations.easeOutExpo, time:.8});
    	}
    	
    	public function hide():void
    	{
    		visible = false;
    	}
    	
    	public function get activeTip():TipView
    	{ 
    		return _activeTip;
    	}
    	
    	public function showPlainTextView(val:String):void
    	{
			resetView();
			
			var view:PlainTextView = new PlainTextView();
			view.addEventListener(PlainTextView.SHOW_TIPS, handleEvent);
			contentHolder.addChild(view);
			view.setContent(val);
			_currentView = view;
			
			_scroller.init(contentHolder, Equations.easeOutExpo, .5, false, 1);
		}
		
		public function showTipTextView(tips:XML):void
		{
			resetView();
			
			parseTips(tips);
		}
		
		public function resetView():void
		{	
			if(_currentView != null)
			{
				contentHolder.removeChild(_currentView);
				_scroller.reset();
				_currentView = null;	
			}
			
			if(_tips.length > 0)
			{
				for(var i:uint = 0; i < _tips.length; i++)
				{
					contentHolder.removeChild(_tips[i]);
				}
				
				_tips = [];
				_scroller.reset();
				_activeTip = null;
			}	
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
	    			if(event.target == link_github) openExternalURL("http://github.com/darscan");
    			break;
    			case TipView.SHOW_TIP:
    				var tip:TipView = event.target as TipView;
					if(_activeTip != null && _activeTip != tip) 
						_activeTip.resetView();
					_activeTip = tip;
					dispatchEvent(new Event(ContentView.SHOW_TIP_ON_MAP));
				break;
				case PlainTextView.SHOW_TIPS:
					dispatchEvent(new Event(ContentView.SHOW_TIPS));
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
    		
    		x = 390;
    		y = 1500;
    		
			link_github.buttonMode = true;
			
			_scroller = new CustomScrollbar();
			_scroller.x = placeHolderScroller.x;
			_scroller.y = placeHolderScroller.y;
			addChild(_scroller);
			
			placeHolderScroller.visible = false;
		}

		private function initializeBehaviour():void
    	{
			link_github.addEventListener(MouseEvent.MOUSE_UP, handleEvent);
		}
		
		private function openExternalURL(url:String):void
		{
			var request:URLRequest = new URLRequest();
			request.url = url;
			navigateToURL(request, "_blank");
		}
		
		private function parseTips(tips:XML):void
		{
			var mapTips:XMLList = tips..tip;
			var tipsCount:uint = mapTips.length();
			
			if(tipsCount > 0)
			{
				var yVal:uint = 0;
				var i:uint = 0;
				
				for(i = 0; i < tipsCount; i++)
				{
					var tipXml:XML = mapTips[i];
					var tipText:String = tipXml.@text;
					var file:String = tipXml.@file;
					
					var tip:TipView = new TipView();
					tip.addEventListener(TipView.SHOW_TIP, handleEvent);
					tip.setTipText(tipText);
					tip.id = i;
					tip.y = yVal;
					contentHolder.addChild(tip);
					_tips.push(tip);
					yVal += 73;
				}
			}
		}
	}
}