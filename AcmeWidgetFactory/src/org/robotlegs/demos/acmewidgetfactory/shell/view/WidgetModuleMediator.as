package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetProxy;
	import org.robotlegs.mvcs.Mediator;
	
	public class WidgetModuleMediator extends Mediator
	{
		[Inject]
		public var module:IWidgetModule;
		
		[Inject]
		public var activeWidgetProxy:ActiveWidgetProxy;
		
		private var subContext:IContext;
		
		public function WidgetModuleMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Invoke module API through interface IWidget
			module.setTitle(activeWidgetProxy.getWidgetId(module));
			
			// Retrieve access to this Widget's Context (Sub Context) and EventDispatcher
			subContext = module.getContext();
			
			// Sub Context (child context) Listeners
			addEventListenerTo(subContext, ContextEvent.SHUTDOWN_COMPLETE, onWidgetShutdownComplete);
			// Be aware of directly compiling module Events into shell SWF
			addEventListenerTo(subContext, WidgetEvent.POKE_WIDGET_COMPLETE, onPokeWidgetComplete);
			
			// Shell Context Listeners
			addEventListenerTo(eventDispatcher, ShellEvent.REMOVE_ALL_WIDGETS, onRemoveAllWidgets);
		}
		
		protected function onWidgetShutdownComplete(e:org.robotlegs.base.ContextEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, activeWidgetProxy.getWidgetId(module)));
		}
		
		protected function onPokeWidgetComplete(e:WidgetEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.POKE_WIDGET_COMPLETE, activeWidgetProxy.getWidgetId(module)));
		}
		
		protected function onRemoveAllWidgets(e:ShellEvent):void
		{
			dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET, activeWidgetProxy.getWidgetId(module)));
		}
	}
}