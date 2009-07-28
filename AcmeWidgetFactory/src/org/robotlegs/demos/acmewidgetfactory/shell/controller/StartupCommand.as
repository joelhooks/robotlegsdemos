package org.robotlegs.demos.acmewidgetfactory.shell.controller
{
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.ILoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.LoggerModule;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.WidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellLoggerEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellWidgetEvent;
	import org.robotlegs.demos.acmewidgetfactory.shell.model.ActiveWidgetProxy;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.ControlPanelMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.ControlPanelView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerHolderMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerHolderView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.LoggerModuleMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetHolderMediator;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetHolderView;
	import org.robotlegs.demos.acmewidgetfactory.shell.view.WidgetModuleMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;

	public class StartupCommand extends Command
	{
		override public function execute():void
		{
			// Controller
			commandFactory.mapCommand(ShellWidgetEvent.CREATE_WIDGET, CreateWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.POKE_WIDGET, PokeWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.REMOVE_WIDGET, RemoveWidgetCommand);
			commandFactory.mapCommand(ShellWidgetEvent.REMOVE_WIDGET_COMPLETE, UnregisterWidgetCommand);
			commandFactory.mapCommand(ShellLoggerEvent.CREATE_LOGGER, CreateLoggerCommand);
			
			// Model
			injector.bindSingleton(ActiveWidgetProxy);
			
			// View
			mediatorFactory.mapMediator(ControlPanelView, ControlPanelMediator);
			mediatorFactory.mapMediator(LoggerHolderView, LoggerHolderMediator);
			mediatorFactory.mapMediator(WidgetHolderView, WidgetHolderMediator);
			// Module Mediators - should be able to leave these definitions out.. :(
			LoggerModule;
			WidgetModule;
			// Module Views - notice FQCN::string style
			mediatorFactory.mapModuleMediator('org.robotlegs.demos.acmewidgetfactory.modules.logger::LoggerModule', ILoggerModule, LoggerModuleMediator);
			mediatorFactory.mapModuleMediator('org.robotlegs.demos.acmewidgetfactory.modules.widget::WidgetModule', IWidgetModule, WidgetModuleMediator);
			
			// Ready
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}