package org.robotlegs.demos.cafetownsend.main.service.interfaces
{
/** @author Jonathan Toland */
public interface IResourceManagerService
{
	function getString(bundle:*, resourceName:String, parameters:Object = null):String;
	function fillString(resource:String, parameters:Object):String;
}
}