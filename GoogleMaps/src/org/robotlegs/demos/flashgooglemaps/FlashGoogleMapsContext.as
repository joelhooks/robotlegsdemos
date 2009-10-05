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

package org.robotlegs.demos.flashgooglemaps
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepControllerCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepModelCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepViewCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.StartupCommand;
	import org.robotlegs.mvcs.Context;
	
	/**
	 *
	 * @author Peter Lorent peter.lorent@gmail.com
	 *
	 */
	public class FlashGoogleMapsContext extends Context
	{
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Factory method. Provide the Context with the necessary objects to do its work.
		 * Note that the both the injector and reflector are programmed to interfaces
		 * so you can freely change the IoC container and Reflection library you want
		 * to use as long as the 'contract' is fullfilled. See the adapter package
		 * in the RobotLegs source.
		 *
		 * @param contextView DisplayObjectContainer
		 * @param autoStartup Boolean
		 *
		 */
		public function FlashGoogleMapsContext(contextView:DisplayObjectContainer, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Gets called by the framework if autoStartup is true. Here we need to provide
		 * the framework with the basic actors. The proxies/services we want to use in
		 * the model, map some view components to Mediators and to get things started,
		 * add some Sprites to the stage. Only after we drop a Sprite on the stage,
		 * RobotLegs will create the Mediator. See StartupCommand.
		 * Unmap the commands we won't be needing anymore after execution.
		 *
		 */
		override public function startup():void
		{
			commandMap.mapEvent(PrepModelCommand, ContextEvent.STARTUP, ContextEvent, true);
			commandMap.mapEvent(PrepViewCommand, ContextEvent.STARTUP, ContextEvent, true);
			commandMap.mapEvent(PrepControllerCommand, ContextEvent.STARTUP, ContextEvent);
			commandMap.mapEvent(StartupCommand, ContextEvent.STARTUP, ContextEvent, true);
			
			// fire!
			dispatch(new ContextEvent(ContextEvent.STARTUP));
		}
	
	}
}