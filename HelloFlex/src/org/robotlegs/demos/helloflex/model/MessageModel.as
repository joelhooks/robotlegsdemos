package org.robotlegs.demos.helloflex.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Model;
	
	public class MessageModel extends Model
	{
		private var messages:ArrayCollection;
		
		public function MessageModel()
		{
			messages = new ArrayCollection();
		}
		
		public function addMessage(message:String):void
		{
			messages.addItem((messages.length + 1) + ': ' + message);
			dispatchEvent(new MessageModelEvent(MessageModelEvent.MESSAGE_ADDED, message));
		}
		
		public function get messageList():ArrayCollection
		{
			return messages;
		}
		
		public function clearMessages():void
		{
			messages.removeAll();
			dispatchEvent(new MessageModelEvent(MessageModelEvent.MESSAGES_CLEARED));
		}
	
	}
}