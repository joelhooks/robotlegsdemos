package org.robotlegs.demos.acmewidgetfactory.modules.widget.controller
{
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvas;
	import org.robotlegs.demos.acmewidgetfactory.modules.widget.view.WidgetCanvasMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.mvcs.ContextEvent;
	
	public class WidgetStartupCommand extends Command
	{
		override public function execute():void
		{
			// Controller
			commandFactory.mapCommand(ContextEvent.SHUTDOWN, WidgetShutdownCommand, true);
			
			// View
			mediatorFactory.mapMediator(WidgetCanvas, WidgetCanvasMediator);
			
			// Ready
			dispatch(new ContextEvent(ContextEvent.STARTUP_COMPLETE));
		}
	}
}