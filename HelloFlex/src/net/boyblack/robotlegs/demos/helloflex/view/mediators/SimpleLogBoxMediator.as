package net.boyblack.robotlegs.demos.helloflex.view.mediators
{
	import net.boyblack.robotlegs.demos.helloflex.model.events.MessageProxyEvent;
	import net.boyblack.robotlegs.demos.helloflex.model.events.UserProxyEvent;
	import net.boyblack.robotlegs.demos.helloflex.view.components.SimpleLogBox;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class SimpleLogBoxMediator extends FlexMediator
	{
		[Inject]
		public var simpleLogBox:SimpleLogBox;

		public function SimpleLogBoxMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			addEventListenerTo( eventDispatcher, MessageProxyEvent.MESSAGE_ADDED, whenMessageAdded );
			addEventListenerTo( eventDispatcher, MessageProxyEvent.MESSAGES_CLEARED, whenMessagesCleared );
			addEventListenerTo( eventDispatcher, UserProxyEvent.USER_LOGGED_IN, whenUserLoggedIn );
			addEventListenerTo( eventDispatcher, UserProxyEvent.USER_LOGGED_OUT, whenUserLoggedOut );
		}

		private function whenMessageAdded( e:MessageProxyEvent ):void
		{
			simpleLogBox.log( 'Message Added' );
		}

		private function whenMessagesCleared( e:MessageProxyEvent ):void
		{
			simpleLogBox.log( 'Messages Cleared' );
		}

		private function whenUserLoggedIn( e:UserProxyEvent ):void
		{
			simpleLogBox.log( 'User Logged In' );
		}

		private function whenUserLoggedOut( e:UserProxyEvent ):void
		{
			simpleLogBox.log( 'User Logged Out' );
		}

	}
}