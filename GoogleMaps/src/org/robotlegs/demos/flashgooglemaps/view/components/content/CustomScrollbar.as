/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package org.robotlegs.demos.flashgooglemaps.view.components.content
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.display.DisplayObject;
	
	import caurina.transitions.Tweener;
	import caurina.transitions.Equations;
	
	/**
	 * Just a custom scroll bar. Not relevant to the framework
	 * therefore no comments.
	 * 
	 * @author Peter Lorent peter.lorent@gmail.com
	 * 
	 */	
	[Embed(source='assets/swf/contentAssets.swf', symbol='CustomScroller')]
	public class CustomScrollbar extends MovieClip
	{
		//--------------------------------------------------------------------------
		//
		//  Instance Properties
		//
		//--------------------------------------------------------------------------
		public var scroller:MovieClip;
		public var upArrow:MovieClip;
		public var downArrow:MovieClip;
		public var track:MovieClip;
		
		private var target:DisplayObject;
		private var top:Number;
		private var bottom:Number;
		private var dragBot:Number;
		private var range:Number;
		private var ratio:Number;
		private var sPos:Number;
		private var sRect:Rectangle;
		private var ctrl:Number;
		private var trans:Function;
		private var timing:Number;
		private var isUp:Boolean;
		private var isDown:Boolean;
		private var isArrow:Boolean;
		private var arrowMove:Number;
		private var upArrowHt:Number;
		private var downArrowHt:Number;
		private var sBuffer:Number;
		private var _initialized:Boolean = false;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		public function CustomScrollbar()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  API
		//
		//--------------------------------------------------------------------------
		public function get initialized():Boolean { return _initialized }
		
		public function init(targetClip:DisplayObject, transition:Function, time:Number, useArrows:Boolean, buffer:Number, autoHide:Boolean = true):void
		{
			target = targetClip;
			trans = transition;
			timing = time;
			isArrow = useArrows;
			sBuffer = buffer;
			
			setCorrectSize();
			
			if(autoHide)
			{
				if (target.height <= track.height) visible = false;
			}			
			
			if (isArrow)
			{
				upArrowHt = upArrow.height;
				downArrowHt = downArrow.height;
				top = scroller.y;
				dragBot = (scroller.y + track.height) - scroller.height;
				bottom = track.height - (scroller.height/sBuffer);
			}
			else
			{
				top = scroller.y;
				dragBot = (scroller.y + track.height) - scroller.height;
				bottom = track.height - (scroller.height/sBuffer);
				
				if(isArrow)
				{
					upArrowHt = 0;
					downArrowHt = 0;
					removeChild(upArrow);
					removeChild(downArrow);
				}
			}
			range = bottom - top;
			sRect = new Rectangle(0, top, 0, dragBot);
			ctrl = target.y;
			
			isUp = false;
			isDown = false;
			arrowMove = 10;
			
			if(isArrow)
			{
				upArrow.addEventListener(MouseEvent.MOUSE_DOWN, upScroll);
				downArrow.addEventListener(MouseEvent.MOUSE_DOWN, downScroll);
			}
			
			if(stage) addStageHandlers();		
			else addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
			
			track.addEventListener(MouseEvent.CLICK, trackClickHandler);
			scroller.addEventListener(MouseEvent.MOUSE_DOWN, dragScroll);
			
			_initialized = true;	
		}
		
		public function reset():void
		{
			scroller.y = 0;
			ratio = (target.height - range) / range;
			sPos = (scroller.y * ratio) - ctrl;
			target.y = -sPos;
			visible = true;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Eventhandling
		//
		//--------------------------------------------------------------------------
		private function addedToStageHandler(e:Event):void
		{
			addStageHandlers();
		}
		
		private function addStageHandlers():void
		{
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, scrollWheelHandler);
			stage.addEventListener(Event.ENTER_FRAME, contentSizeCheckHandler);
		}
		
		private function removedFromStageHandler(e:Event):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_WHEEL, scrollWheelHandler);
			stage.removeEventListener(Event.ENTER_FRAME, contentSizeCheckHandler);
		}
		
		private function contentSizeCheckHandler(e:Event):void 
		{
			if(target.height < height) visible = false;
		}
		
		// TODO: implement a mousewheel
		private function scrollWheelHandler(e:MouseEvent):void
		{
			if(e.delta > 0) goUp();
			else goDown();
		}
		
		private function trackClickHandler(e:MouseEvent):void
		{
			if(mouseY > scroller.y) goDown();
			else goUp();
		}
		
		private function upScroll(event:MouseEvent):void
		{
			isUp = true;
			addEventListener(Event.ENTER_FRAME, upArrowHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
		}
		
		private function downScroll(event:MouseEvent):void
		{
			isDown = true;
			addEventListener(Event.ENTER_FRAME, downArrowHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
		}
		
		private function upArrowHandler(event:Event=null):void
		{
			if(isUp) goUp();
		}
		
		private function goUp():void
		{
			if (scroller.y > top)
			{
				scroller.y -= arrowMove;
				
				if (scroller.y < top)
				{
					scroller.y = top;
				}
				
				startScroll();
			}
		}
		
		private function downArrowHandler(event:Event=null):void
		{
			if(isDown) goDown();
		}
		
		private function goDown():void
		{
			if (scroller.y < dragBot)
			{
				scroller.y += arrowMove;
				
				if (scroller.y > dragBot)
				{
					scroller.y = dragBot;
				}
				
				startScroll();
			}
		}
		
		private function dragScroll(event:MouseEvent):void
		{			
			scroller.startDrag(false, sRect);
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveScroll);
			stage.addEventListener(MouseEvent.MOUSE_UP, stopScroll);
		}
		
		private function stopScroll(event:MouseEvent):void
		{
			isUp = false;
			isDown = false;
			scroller.stopDrag();

			stage.removeEventListener(MouseEvent.MOUSE_MOVE, moveScroll);
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopScroll);
			removeEventListener(Event.ENTER_FRAME, upArrowHandler);
			removeEventListener(Event.ENTER_FRAME, downArrowHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, stopScroll);
		}
		
		private function moveScroll(event:MouseEvent):void
		{
			startScroll();
		}
		
		private function startScroll():void
		{
			ratio = (target.height - range) / range;
			sPos = (scroller.y * ratio) - ctrl;
			
			Tweener.addTween(target, {y:-sPos, transition:trans, time:timing});
		}
		
		private function setCorrectSize():void
		{
			var h:Number = height;
			scaleY = 1;
			
			if(isArrow)
			{
				downArrow.y = h - (downArrow.height * 2);
				track.height = downArrow.y;
			}
			else
			{
				track.height = h;
			}
		}
	}
}