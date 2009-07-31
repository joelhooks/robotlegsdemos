package org.robotlegs.demos.acmewidgetfactory.common.interfaces
{
	import org.robotlegs.core.IContextProvider;
	
	public interface ILoggerModule extends IContextProvider
	{
		function logMessage(message:String):void;
		function clearMessages():void;
		function close():void;;
	}
}