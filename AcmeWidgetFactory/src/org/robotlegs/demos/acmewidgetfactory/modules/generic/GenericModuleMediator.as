/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.demos.acmewidgetfactory.modules.generic
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ModuleEventDispatcher;
	import org.robotlegs.mvcs.Mediator;
	
	public class GenericModuleMediator extends Mediator
	{
		[Inject]
		public var view:GenericModule;
		
		[Inject]
		public var moduleDispatcher:ModuleEventDispatcher;
		
		override public function onRegister():void
		{
			eventMap.mapListener(view, MouseEvent.CLICK, onViewClick);
			eventMap.mapListener(moduleDispatcher, "SomeModuleEvent", onSomeModuleEvent );
		}
		
		protected function onViewClick(e:MouseEvent):void
		{
			moduleDispatcher.dispatchEvent(new Event("SomeModuleEvent"));
		}
		
		protected function onSomeModuleEvent(e:Event):void
		{
			view.alpha *= 0.8;
			(view.alpha > 0.1) || (view.alpha = 0.9);
		}
	
	}
}