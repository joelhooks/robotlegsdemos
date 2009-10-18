package org.robotlegs.demos.helloflex.view
{
	import org.robotlegs.demos.helloflex.model.MessageModel;
	import org.robotlegs.demos.helloflex.model.MessageModelEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class HelloFormMediator extends Mediator
	{
		[Inject]
		public var helloForm:HelloForm;
		
		[Inject]
		public var messageModel:MessageModel;
		
		public function HelloFormMediator()
		{
		}
		
		override public function onRegister():void
		{
			// View Listeners
			eventMap.mapListener(helloForm, HelloFormEvent.FORM_SUBMITTED, onFormSubmitted);
			// Context Listeners
			eventMap.mapListener(eventDispatcher, MessageModelEvent.MESSAGE_ADDED, whenMessageAdded);
		}
		
		private function onFormSubmitted(e:HelloFormEvent):void
		{
			messageModel.addMessage(helloForm.getMessage());
		}
		
		private function whenMessageAdded(e:MessageModelEvent):void
		{
			helloForm.messageTxt.setFocus();
		}
	
	}
}