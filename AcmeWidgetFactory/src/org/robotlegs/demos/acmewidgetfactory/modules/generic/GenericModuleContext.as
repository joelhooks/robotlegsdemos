/*
 * Copyright (c) 2009 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package org.robotlegs.demos.acmewidgetfactory.modules.generic
{
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class GenericModuleContext extends ModuleContext
	{
		
		override public function startup():void
		{
			mediatorMap.mapView(GenericModule, GenericModuleMediator);
		}
	
	}
}