package org.robotlegs.demos.helloflex.view.mediators
{
	import org.robotlegs.demos.helloflex.model.events.MessageProxyEvent;
	import org.robotlegs.demos.helloflex.model.events.UserProxyEvent;
	import org.robotlegs.demos.helloflex.view.components.SimpleLogBox;
	import org.robotlegs.mvcs.FlexMediator;
	
	public class SimpleLogBoxMediator extends FlexMediator
	{
		[Inject]
		public var simpleLogBox:SimpleLogBox;
		
		public function SimpleLogBoxMediator()
		{
		}
		
		override public function onRegister():void
		{
			addEventListenerTo(eventDispatcher, MessageProxyEvent.MESSAGE_ADDED, whenMessageAdded);
			addEventListenerTo(eventDispatcher, MessageProxyEvent.MESSAGES_CLEARED, whenMessagesCleared);
			addEventListenerTo(eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn);
			addEventListenerTo(eventDispatcher, UserProxyEvent.USER_LOGGED_OUT, whenUserLoggedOut);
		}
		
		private function whenMessageAdded(e:MessageProxyEvent):void
		{
			simpleLogBox.log('Message Added');
		}
		
		private function whenMessagesCleared(e:MessageProxyEvent):void
		{
			simpleLogBox.log('Messages Cleared');
		}
		
		private function whenUserLoggedIn(e:UserProxyEvent):void
		{
			simpleLogBox.log('User Logged In');
		}
		
		private function whenUserLoggedOut(e:UserProxyEvent):void
		{
			simpleLogBox.log('User Logged Out');
		}
	
	}
}