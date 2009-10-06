package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellLoggerEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetProxyEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class LoggerModuleMediator extends Mediator
	{
		[Inject]
		public var module:ILoggerModule;
		
		private var subContext:IContext;
		
		public function LoggerModuleMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Retrieve access to this Module's Context (Sub Context) and EventDispatcher
			subContext = module.getContext();
			
			// Sub Context (child context) Listeners
			addEventListenerTo(subContext, ContextEvent.SHUTDOWN_COMPLETE, onLoggerShutdownComplete);
			
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
		
		protected function onLoggerShutdownComplete(e:org.robotlegs.base.ContextEvent):void
		{
			dispatchEvent(new ShellLoggerEvent(ShellLoggerEvent.SHUTDOWN_LOGGER_COMPLETE, module));
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