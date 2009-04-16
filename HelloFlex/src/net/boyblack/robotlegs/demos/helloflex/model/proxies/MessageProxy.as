package net.boyblack.robotlegs.demos.helloflex.model.proxies
{
	import mx.collections.ArrayCollection;

	import net.boyblack.robotlegs.demos.helloflex.model.events.MessageProxyEvent;
	import net.boyblack.robotlegs.mvcs.Proxy;

	public class MessageProxy extends Proxy
	{
		private var messages:ArrayCollection;

		public function MessageProxy()
		{
			messages = new ArrayCollection();
		}

		public function addMessage( message:String ):void
		{
			messages.addItem( ( messages.length + 1 ) + ': ' + message );
			dispatch( new MessageProxyEvent( MessageProxyEvent.MESSAGE_ADDED, message ) );
		}

		public function get messageList():ArrayCollection
		{
			return messages;
		}

		public function clearMessages():void
		{
			messages.removeAll();
			dispatch( new MessageProxyEvent( MessageProxyEvent.MESSAGES_CLEARED ) );
		}

	}
}