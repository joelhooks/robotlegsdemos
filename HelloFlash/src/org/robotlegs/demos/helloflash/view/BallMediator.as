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

package org.robotlegs.demos.helloflash.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.helloflash.controller.HelloFlashEvent;
	import org.robotlegs.demos.helloflash.model.StatsModel;
	import org.robotlegs.mvcs.Mediator;
	
	public class BallMediator extends Mediator
	{
		[Inject]
		public var view:Ball;
		
		[Inject]
		public var statsModel:StatsModel;
		
		public function BallMediator()
		{
			// Avoid doing work in your constructors!
			// Mediators are only ready to be used when onRegister gets called
		}
		
		override public function onRegister():void
		{
			// Listen to the view
			eventMap.mapListener(view, MouseEvent.CLICK, onClick);
			// Listen to the context
			eventMap.mapListener(eventDispatcher, HelloFlashEvent.BALL_CLICKED, onSomeBallClicked);
		}
		
		protected function onClick(e:MouseEvent):void
		{
			// Manipulate the model
			statsModel.recordBallClick();
			// Dispatch to context
			eventDispatcher.dispatchEvent(new HelloFlashEvent(HelloFlashEvent.BALL_CLICKED));
		}
		
		protected function onSomeBallClicked(e:HelloFlashEvent):void
		{
			// Manipulate the view
			view.poke();
		}
	}
}