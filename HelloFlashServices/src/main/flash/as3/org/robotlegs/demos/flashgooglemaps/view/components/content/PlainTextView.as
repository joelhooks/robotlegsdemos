package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.StyleSheet;
	import flash.events.TextEvent;
	import flash.events.Event;

	[Embed(source='../../../../../../../../assets/swf/contentAssets.swf', symbol='PlainTextView')]
	public class PlainTextView extends MovieClip
	{
		//--------------------------------------------------------------------------
		//
		//  Class properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIPS:String = "showTips";
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		public var contentWindow:MovieClip;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function PlainTextView()
		{
			super();
			
			initializeView();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function setContent(val:String):void
		{
			contentWindow.contentField.htmlText = val;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleEvent(event:TextEvent):void
		{
			dispatchEvent(new Event(PlainTextView.SHOW_TIPS));
		}

		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function initializeView():void
		{
			x = 30;

            contentWindow.contentField.styleSheet = initializeStyles();
            contentWindow.contentField.autoSize = "left";
            contentWindow.contentField.addEventListener(TextEvent.LINK, handleEvent);
		}
	
		private function initializeStyles():StyleSheet
		{
			var style:StyleSheet = new StyleSheet();
	
	        var quote:Object = new Object();
	        quote.fontSize = "24";
	        quote.textAlign = "center";
	        
	        var mbold:Object = new Object();
	        //mbold.fontFamily = PlainTextView.MAQUETTE_BOLD;
	        
	        var link:Object = new Object();
	        link.fontSize = "24";
	        link.textAlign = "center";
	        link.color = "#ee820f";
	        link.textDecoration = "underline";
	
			style.setStyle(".quote", quote);
			style.setStyle(".mbold", mbold);
			style.setStyle(".link", link);
			
			return style;
		}
	}
}