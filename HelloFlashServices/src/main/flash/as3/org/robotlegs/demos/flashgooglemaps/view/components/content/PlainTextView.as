package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.text.StyleSheet;
	import flash.events.TextEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;

	[Embed(source='../../../../../../../../assets/swf/contentAssets.swf', symbol='PlainTextView')]
	public class PlainTextView extends MovieClip
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIPS:String = "showTips";
		
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
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
		
		public function destroy():void
		{
			contentWindow.contentField.removeEventListener(TextEvent.LINK, handleEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function handleEvent(event:TextEvent):void
		{
				dispatchEvent(new Event(event.text));
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
            contentWindow.contentField.autoSize = TextFieldAutoSize.LEFT;
            contentWindow.contentField.addEventListener(TextEvent.LINK, handleEvent);
		}
	
		private function initializeStyles():StyleSheet
		{
			var style:StyleSheet = new StyleSheet();
	
	        var quote:Object = new Object();
	        quote.fontSize = "21";
	        quote.textAlign = "center";
	        
	        var mbold:Object = new Object();
	        mbold.fontFamily = "Myriad Pro Semibold";
	        
	        var link:Object = new Object();
	        link.fontSize = "24";
	        link.textAlign = "center";
	        link.color = "#b30d0d";
	        link.textDecoration = "underline";
	
			style.setStyle(".quote", quote);
			style.setStyle(".mbold", mbold);
			style.setStyle(".link", link);
			
			return style;
		}
	}
}