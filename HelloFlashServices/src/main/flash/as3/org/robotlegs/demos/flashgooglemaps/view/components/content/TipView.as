package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	[Embed(source='../../../../../../../../assets/swf/contentAssets.swf', symbol='TipView')]
	public class TipView extends Sprite
	{
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		public static const SHOW_TIP:String = "showTip";
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var tipText:TextField;
		public var active:MovieClip;
		
		private var _id:uint;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function TipView()
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
		public function setTipText(val:String):void
		{
			tipText.htmlText = val;
		}
		
		public function set id(val:uint):void
		{
			_id = val;
		}
		
		public function get id():uint
		{
			return _id;
		}
		
		public function resetView():void
		{
			active.alpha = 0;
			
			initializeBehaviour();
		}
		
		public function destroy():void
		{
			deinitializeBehaviour();
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
				case MouseEvent.MOUSE_OVER:
					active.alpha = 1;
				break;
				case MouseEvent.MOUSE_OUT:
					active.alpha = 0;
				break;
				case MouseEvent.MOUSE_DOWN:
					deinitializeBehaviour();
					dispatchEvent(new Event(TipView.SHOW_TIP));
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
			active.alpha = 0;
			active.buttonMode = true;
			tipText.mouseEnabled = false;
		}

		private function initializeBehaviour():void
		{
			active.addEventListener(MouseEvent.MOUSE_OVER, handleEvent);
			active.addEventListener(MouseEvent.MOUSE_OUT, handleEvent);
			active.addEventListener(MouseEvent.MOUSE_DOWN, handleEvent);
		}
		
		private function deinitializeBehaviour():void
		{
			active.removeEventListener(MouseEvent.MOUSE_OVER, handleEvent);
			active.removeEventListener(MouseEvent.MOUSE_OUT, handleEvent);
			active.removeEventListener(MouseEvent.MOUSE_DOWN, handleEvent);
		}
	}
}