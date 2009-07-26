package org.robotlegs.demos.acmewidgetfactory.common.interfaces
{
	import org.robotlegs.core.IContextProvider;
	
	public interface IWidgetModule extends IContextProvider
	{
		function setTitle(title:String):void;
		function poke():void;
		function close():void;
	}
}