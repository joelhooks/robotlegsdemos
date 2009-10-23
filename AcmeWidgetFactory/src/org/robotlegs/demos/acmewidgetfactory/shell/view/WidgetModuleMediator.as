package org.robotlegs.demos.acmewidgetfactory.shell.view
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IContext;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.controller.WidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.controller.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetModel;
	import org.robotlegs.mvcs.Mediator;
	
	public class WidgetModuleMediator extends Mediator
	{
		[Inject]
		public var module:IWidgetModule;
		
		[Inject]
		public var activeWidgetModel:ActiveWidgetModel;
		
		private var subContext:IContext;
		
		public function WidgetModuleMediator()
		{
		}
		
		override public function onRegister():void
		{
			// Invoke module API through interface IWidget
			module.setTitle(activeWidgetModel.getWidgetId(module));
			
			// Retrieve access to this Widget's Context (Sub Context) and EventDispatcher
			subContext = module.getContext();
			
			// Sub Context (child context) Listeners
			eventMap.mapListener(subContext.eventDispatcher, ContextEvent.SHUTDOWN_COMPLETE, onWidgetShutdownComplete);
			// Be aware of directly compiling module Events into shell SWF
			eventMap.mapListener(subContext.eventDispatcher, WidgetEvent.POKE_WIDGET_COMPLETE, onPokeWidgetComplete);
			
			// Shell Context Listeners
			eventMap.mapListener(eventDispatcher, ShellEvent.REMOVE_ALL_WIDGETS, onRemoveAllWidgets);
		}
		
		protected function onWidgetShutdownComplete(e:org.robotlegs.base.ContextEvent):void
		{
			eventDispatcher.dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.SHUTDOWN_WIDGET_COMPLETE, activeWidgetModel.getWidgetId(module)));
		}
		
		protected function onPokeWidgetComplete(e:WidgetEvent):void
		{
			eventDispatcher.dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.POKE_WIDGET_COMPLETE, activeWidgetModel.getWidgetId(module)));
		}
		
		protected function onRemoveAllWidgets(e:ShellEvent):void
		{
			eventDispatcher.dispatchEvent(new ShellWidgetEvent(ShellWidgetEvent.REMOVE_WIDGET, activeWidgetModel.getWidgetId(module)));
		}
	}
}