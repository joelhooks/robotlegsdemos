package net.boyblack.robotlegs.demos.helloflex.view.mediators
{
	import net.boyblack.robotlegs.demos.helloflex.model.events.MessageProxyEvent;
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import net.boyblack.robotlegs.demos.helloflex.view.components.HelloForm;
	import net.boyblack.robotlegs.demos.helloflex.view.events.HelloFormEvent;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class HelloFormMediator extends FlexMediator
	{
		[Inject]
		public var helloForm:HelloForm;

		[Inject]
		public var messageProxy:MessageProxy;

		public function HelloFormMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			// View Listeners
			addEventListenerTo( helloForm, HelloFormEvent.FORM_SUBMITTED, onFormSubmitted );
			// Context Listeners
			addEventListenerTo( eventDispatcher, MessageProxyEvent.MESSAGE_ADDED, whenMessageAdded );
		}

		private function onFormSubmitted( e:HelloFormEvent ):void
		{
			messageProxy.addMessage( helloForm.getMessage() );
		}

		private function whenMessageAdded( e:MessageProxyEvent ):void
		{
			helloForm.messageTxt.setFocus();
		}

	}
}