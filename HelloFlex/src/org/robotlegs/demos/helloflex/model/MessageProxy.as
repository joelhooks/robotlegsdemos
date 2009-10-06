package org.robotlegs.demos.helloflex.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.demos.helloflex.model.MessageProxyEvent;
	import org.robotlegs.mvcs.Proxy;
	
	public class MessageProxy extends Proxy
	{
		private var messages:ArrayCollection;
		
		public function MessageProxy()
		{
			messages = new ArrayCollection();
		}
		
		public function addMessage(message:String):void
		{
			messages.addItem((messages.length + 1) + ': ' + message);
			dispatchEvent(new MessageProxyEvent(MessageProxyEvent.MESSAGE_ADDED, message));
		}
		
		public function get messageList():ArrayCollection
		{
			return messages;
		}
		
		public function clearMessages():void
		{
			messages.removeAll();
			dispatchEvent(new MessageProxyEvent(MessageProxyEvent.MESSAGES_CLEARED));
		}
	
	}
}