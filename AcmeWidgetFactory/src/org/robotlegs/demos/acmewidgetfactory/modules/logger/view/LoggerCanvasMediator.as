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
			addEventListenerTo(eventDispatcher, LoggerEvent.LOG_MESSAGE, onLogMessage);
		}
		
		protected function onLogMessage(e:LoggerEvent):void
		{
			view.textArea.htmlText += "[" + new Date().toTimeString().substr(0, 8) + " ] <b>" + e.message + "</b>\n";
			view.validateNow();
			view.verticalScrollPosition = view.maxVerticalScrollPosition;
		}
	}
}