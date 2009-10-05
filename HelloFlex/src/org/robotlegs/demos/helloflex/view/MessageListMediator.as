package org.robotlegs.demos.helloflex.view
{
	import org.robotlegs.demos.helloflex.model.MessageProxy;
	import org.robotlegs.demos.helloflex.view.MessageList;
	import org.robotlegs.mvcs.Mediator;
	
	public class MessageListMediator extends Mediator
	{
		[Inject]
		public var messageList:MessageList;
		
		[Inject]
		public var messageProxy:MessageProxy;
		
		public function MessageListMediator()
		{
		}
		
		override public function onRegister():void
		{
			messageList.dataProvider = messageProxy.messageList;
		}
	
	}
}