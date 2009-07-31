package org.robotlegs.demos.acmewidgetfactory.modules.logger.view
{
	import org.robotlegs.demos.acmewidgetfactory.modules.logger.events.LoggerEvent;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class LoggerCanvasMediator extends FlexMediator
	{
		[Inject]
		public var view:LoggerCanvas;
		
		public function LoggerCanvasMediator()
		{
		}
		
		override public function onRegister():void
		{
			addEventListenerTo(eventDispatcher, LoggerEvent.CLEAR_MESSAGES, onClearMessages);
			addEventListenerTo(eventDispatcher, LoggerEvent.LOG_MESSAGE, onLogMessage);
		}
		
		protected function onClearMessages(e:LoggerEvent):void
		{
			view.clearMessages();
		}
		protected function onLogMessage(e:LoggerEvent):void
		{
			view.logMessage(e.message);
		}
	}
}