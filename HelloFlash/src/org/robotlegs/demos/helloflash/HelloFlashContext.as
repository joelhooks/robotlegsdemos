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

package org.robotlegs.demos.helloflash
{
	import flash.display.DisplayObjectContainer;
	
	import org.as3commons.logging.ILogger;
	import org.as3commons.logging.impl.DefaultLogger;
	import org.robotlegs.adapters.SpringInjector;
	import org.robotlegs.adapters.SpringReflector;
	import org.robotlegs.demos.helloflash.controller.PrepControllerCommand;
	import org.robotlegs.demos.helloflash.controller.PrepModelCommand;
	import org.robotlegs.demos.helloflash.controller.PrepViewCommand;
	import org.robotlegs.demos.helloflash.controller.StartupCommand;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class HelloFlashContext extends Context
	{
		public function HelloFlashContext(contextView:DisplayObjectContainer)
		{
			// We must provide RobotLegs with some tools, and a DisplayObjectContainer to watch
			super(contextView, new SpringInjector(), new SpringReflector());
		}
		
		override public function startup():void
		{
			// Map some Commands to a Startup Event
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepControllerCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepModelCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, PrepViewCommand);
			commandFactory.mapCommand(ContextEvent.STARTUP, StartupCommand);
			// And away we go!
			eventDispatcher.dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		override protected function createLogger():ILogger
		{
			// Create an optional logger
			return new DefaultLogger('HelloFlashContext');
		}
	}
}