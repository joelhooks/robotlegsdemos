package org.robotlegs.demos.cafetownsend.main.service
{
import mx.resources.IResourceManager;

import org.robotlegs.core.IReflector;
import org.robotlegs.demos.cafetownsend.main.service.interfaces.IResourceManagerService;
import org.robotlegs.mvcs.Actor;

/** @author Jonathan Toland */
public class ResourceManagerService extends Actor implements IResourceManagerService
{
	private const parametersPattern:RegExp = /\{(\w+)\}/g;
	
	[Inject]
	public var reflector:IReflector;
	[Inject]
	public var resourceManager:IResourceManager;
	
	public function getString(bundle:*, resourceName:String, parameters:Object = null):String
	{
		if (!(bundle is String))
		{
			bundle = getUnqualifiedClassName(bundle);
		}
		return fillString(resourceManager.getString(bundle, resourceName, parameters as Array), parameters);
	}
	
	public function fillString(resource:String, parameters:Object):String
	{
		if (!parameters)
		{
			return resource;
		}
		return resource.replace(parametersPattern, function(str:String, p1:String, offset:int, s:String):String
		{
			return parameters[p1];
		});
	}
	
	private function getUnqualifiedClassName(value:*):String
	{
		return reflector.getFQCN(value).split('::').pop();
	}
	
}
}