package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import flash.events.IEventDispatcher;
	
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellLoggerEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.events.ActiveWidgetProxyEvent;
	import org.robotlegs.mvcs.ContextEvent;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class LoggerModuleMediator extends FlexMediator
	{
		[Inject]
		public var module:ILoggerModule;
		
		private var subContext:IContext;
		private var subContextDispatcher:IEventDispatcher;
		
		public function LoggerModuleMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Retrieve access to this Module's Context (Sub Context) and EventDispatcher
			subContext = module.getContext();
			subContextDispatcher = subContext.getEventDispatcher();
			
			// Sub Context (child context) Listeners
			addEventListenerTo(subContextDispatcher, ContextEvent.SHUTDOWN_COMPLETE, onLoggerShutdownComplete);
			
			// Shell Context Listeners
			addEventListenerTo(eventDispatcher, ShellEvent.CLEAR_LOGGER, onClearLogger);
			addEventListenerTo(eventDispatcher, ActiveWidgetProxyEvent.WIDGET_CREATED, onActiveWidgetProxyEvent);
			addEventListenerTo(eventDispatcher, ActiveWidgetProxyEvent.WIDGET_MODULE_READY, onActiveWidgetProxyEvent);
			addEventListenerTo(eventDispatcher, ActiveWidgetProxyEvent.WIDGET_MODULE_ERROR, onWidgetModuleError);
			addEventListenerTo(eventDispatcher, ActiveWidgetProxyEvent.WIDGET_MODULE_PROGRESS, onWidgetModuleProgress);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.POKE_WIDGET_COMPLETE, onShellWidgetEvent);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, onShellWidgetEvent);
			addEventListenerTo(eventDispatcher, ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, onShellWidgetEvent);
		}
		
		protected function onLoggerShutdownComplete(e:ContextEvent):void
		{
			dispatch(new ShellLoggerEvent(ShellLoggerEvent.SHUTDOWN_LOGGER_COMPLETE, module));
		}
		
		protected function onClearLogger(e:ShellEvent):void
		{
			module.clearMessages();
		}
		
		protected function onActiveWidgetProxyEvent(e:ActiveWidgetProxyEvent):void
		{
			module.logMessage(e.type + ' Widget Id: ' + e.widgetId);
		}
		
		protected function onWidgetModuleError(e:ActiveWidgetProxyEvent):void
		{
			module.logMessage(e.type + ' ' + e.body.errorText);
		}
		
		protected function onWidgetModuleProgress(e:ActiveWidgetProxyEvent):void
		{
			module.logMessage(e.type + ' ' + e.body.bytesLoaded + '/' + e.body.bytesTotal + ' bytes loaded');
		}
		
		protected function onShellWidgetEvent(e:ShellWidgetEvent):void
		{
			module.logMessage(e.type + ' Widget Id: ' + e.widgetId);
		}
	
	}
}