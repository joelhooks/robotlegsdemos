package org.robotlegs.demos.helloflex.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.demos.helloflex.controller.SystemEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class ClearMessagesButtonMediator extends Mediator
	{
		[Inject]
		public var clearMessagesButton:ClearMessagesButton;
		
		public function ClearMessagesButtonMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(clearMessagesButton, MouseEvent.CLICK, onClearMessagesClicked);
		}
		
		private function onClearMessagesClicked(e:MouseEvent):void
		{
			eventDispatcher.dispatchEvent(new SystemEvent(SystemEvent.CLEAR_MESSAGES_REQUESTED));
		}
	
	}
}