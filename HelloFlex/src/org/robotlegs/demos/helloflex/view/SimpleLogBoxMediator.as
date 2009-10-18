package org.robotlegs.demos.helloflex.view
{
	import org.robotlegs.demos.helloflex.model.MessageModelEvent;
	import org.robotlegs.demos.helloflex.model.UserProxyEvent;
	import org.robotlegs.demos.helloflex.view.SimpleLogBox;
	import org.robotlegs.mvcs.Mediator;
	
	public class SimpleLogBoxMediator extends Mediator
	{
		[Inject]
		public var simpleLogBox:SimpleLogBox;
		
		public function SimpleLogBoxMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, MessageModelEvent.MESSAGE_ADDED, whenMessageAdded);
			eventMap.mapListener(eventDispatcher, MessageModelEvent.MESSAGES_CLEARED, whenMessagesCleared);
			eventMap.mapListener(eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn);
			eventMap.mapListener(eventDispatcher, UserProxyEvent.USER_LOGGED_OUT, whenUserLoggedOut);
		}
		
		private function whenMessageAdded(e:MessageModelEvent):void
		{
			simpleLogBox.log('Message Added');
		}
		
		private function whenMessagesCleared(e:MessageModelEvent):void
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