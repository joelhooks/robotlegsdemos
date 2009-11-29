/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.demos.acmewidgetfactory.modules.generic
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ModuleCommandMap;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ModuleEventDispatcher;
	import org.robotlegs.mvcs.Context;
	
	public class GenericModuleContext extends Context
	{
		
		override public function startup():void
		{
			mediatorMap.mapView(GenericModule, GenericModuleMediator);
		}
		
		public function setModuleDispatcher(dispatcher:ModuleEventDispatcher):void
		{
			injector.mapValue(ModuleEventDispatcher, dispatcher);
			injector.mapValue(ModuleCommandMap, new ModuleCommandMap(dispatcher, injector, reflector));
		}
	
	}
}