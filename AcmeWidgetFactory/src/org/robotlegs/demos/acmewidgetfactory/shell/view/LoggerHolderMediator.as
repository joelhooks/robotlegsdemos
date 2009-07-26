package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import mx.core.UIComponent;
	
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellLoggerEvent;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class LoggerHolderMediator extends FlexMediator
	{
		[Inject]
		public var view:LoggerHolderView;
		
		public function LoggerHolderMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Context listeners
			addEventListenerTo(eventDispatcher, ShellLoggerEvent.CREATE_LOGGER_COMPLETE, onCreateLoggerComplete);
			addEventListenerTo(eventDispatcher, ShellLoggerEvent.SHUTDOWN_LOGGER_COMPLETE, onShutdownLoggerComplete);
			
			// Create the first one
			dispatch(new ShellLoggerEvent(ShellLoggerEvent.CREATE_LOGGER, null));
		}
		
		protected function onCreateLoggerComplete(e:ShellLoggerEvent):void
		{
			view.addChild(e.loggerModule as UIComponent);
		}
		
		protected function onShutdownLoggerComplete(e:ShellLoggerEvent):void
		{
			view.removeChild(e.loggerModule as UIComponent);
			dispatch(new ShellLoggerEvent(ShellLoggerEvent.REMOVE_LOGGER_COMPLETE, e.loggerModule));
		}
	
	}
}