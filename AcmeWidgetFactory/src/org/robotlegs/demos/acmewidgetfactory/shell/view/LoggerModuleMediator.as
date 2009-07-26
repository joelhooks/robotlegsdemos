package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import flash.events.IEventDispatcher;
	
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.LoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellLoggerEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellWidgetEvent;
	import org.robotlegs.mvcs.ContextEvent;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class LoggerModuleMediator extends FlexMediator
	{
		[Inject]
		public var module:LoggerModule;
		
		private var subContext:IContext;
		private var subContextDispatcher:IEventDispatcher;
		
		public function LoggerModuleMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Retrieve access to this Widget's Context (Sub Context) and EventDispatcher
			subContext = module.getContext();
			subContextDispatcher = subContext.getEventDispatcher();
			
			// Sub Context (child context) Listeners
			addEventListenerTo(subContextDispatcher, ContextEvent.SHUTDOWN_COMPLETE, onLoggerShutdownComplete);
			
			// Shell Context Listeners
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.CREATE_WIDGET_COMPLETE, onShellWidgetEvent);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.POKE_WIDGET_COMPLETE, onShellWidgetEvent);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, onShellWidgetEvent);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, onShellWidgetEvent);
		}
		
		protected function onLoggerShutdownComplete(e:ContextEvent):void
		{
			dispatch(new ShellLoggerEvent(ShellLoggerEvent.SHUTDOWN_LOGGER_COMPLETE, module));
		}
		
		protected function onShellWidgetEvent(e:ShellWidgetEvent):void
		{
			module.logMessage(e.type + ' with Widget Id: ' + e.widgetId);
		}
	
	}
}