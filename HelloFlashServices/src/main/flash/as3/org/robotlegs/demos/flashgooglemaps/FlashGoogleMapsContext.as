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
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.mvcs.ContextEvent;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepModelCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepViewCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.PrepControllerCommand;
	import org.robotlegs.demos.flashgooglemaps.control.commands.StartupCommand;

	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.impl.DefaultLogger;

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
		 * @param injector IInjector
		 * @param reflector IReflector
		 * @param autoStartup Boolean
		 * 
		 */		
		public function FlashGoogleMapsContext(contextView:DisplayObjectContainer, injector:IInjector, reflector:IReflector, autoStartup:Boolean = true)
		{
			super(contextView, injector, reflector, autoStartup);
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
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepModelCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepViewCommand, true);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepControllerCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, StartupCommand, true);
			
			// fire!
			eventBroadcaster.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		/**
		 * Lets trace some stuff so we can keep an eye on what goes on.
		 * 
		 * @return DefaultLogger
		 * 
		 */		
		override protected function createLogger():ILogger
		{
			return new DefaultLogger('FlashGoogleMapsContext');
		}
	}
}