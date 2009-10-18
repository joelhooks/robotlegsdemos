package org.robotlegs.demos.helloflex.view
{
	import org.robotlegs.demos.helloflex.model.MessageModel;
	import org.robotlegs.mvcs.Mediator;
	
	public class MessageListMediator extends Mediator
	{
		[Inject]
		public var messageList:MessageList;
		
		[Inject]
		public var messageModel:MessageModel;
		
		public function MessageListMediator()
		{
		}
		
		override public function onRegister():void
		{
			messageList.dataProvider = messageModel.messageList;
		}
	
	}
}