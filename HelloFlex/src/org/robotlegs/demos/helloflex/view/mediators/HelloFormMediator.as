package org.robotlegs.demos.helloflex.view.mediators
{
	import org.robotlegs.demos.helloflex.model.events.MessageProxyEvent;
	import org.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import org.robotlegs.demos.helloflex.view.components.HelloForm;
	import org.robotlegs.demos.helloflex.view.events.HelloFormEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class HelloFormMediator extends Mediator
	{
		[Inject]
		public var helloForm:HelloForm;
		
		[Inject]
		public var messageProxy:MessageProxy;
		
		public function HelloFormMediator()
		{
		}
		
		override public function onRegister():void
		{
			// View Listeners
			addEventListenerTo(helloForm, HelloFormEvent.FORM_SUBMITTED, onFormSubmitted);
			// Context Listeners
			addEventListenerTo(eventDispatcher, MessageProxyEvent.MESSAGE_ADDED, whenMessageAdded);
		}
		
		private function onFormSubmitted(e:HelloFormEvent):void
		{
			messageProxy.addMessage(helloForm.getMessage());
		}
		
		private function whenMessageAdded(e:MessageProxyEvent):void
		{
			helloForm.messageTxt.setFocus();
		}
	
	}
}