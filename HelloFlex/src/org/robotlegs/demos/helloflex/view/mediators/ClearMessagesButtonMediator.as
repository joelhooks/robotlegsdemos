package org.robotlegs.demos.helloflex.view.mediators
{
	import flash.events.MouseEvent;

	import org.robotlegs.demos.helloflex.controller.events.SystemEvent;
	import org.robotlegs.demos.helloflex.view.components.ClearMessagesButton;
	import org.robotlegs.mvcs.FlexMediator;

	public class ClearMessagesButtonMediator extends FlexMediator
	{
		[Inject]
		public var clearMessagesButton:ClearMessagesButton;

		public function ClearMessagesButtonMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			addEventListenerTo( clearMessagesButton, MouseEvent.CLICK, onClearMessagesClicked );
		}

		private function onClearMessagesClicked( e:MouseEvent ):void
		{
			dispatch( new SystemEvent( SystemEvent.CLEAR_MESSAGES_REQUESTED ) );
		}

	}
}