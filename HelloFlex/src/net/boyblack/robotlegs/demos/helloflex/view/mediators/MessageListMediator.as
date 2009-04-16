package net.boyblack.robotlegs.demos.helloflex.view.mediators
{
	import net.boyblack.robotlegs.demos.helloflex.model.proxies.MessageProxy;
	import net.boyblack.robotlegs.demos.helloflex.view.components.MessageList;
	import net.boyblack.robotlegs.mvcs.FlexMediator;

	public class MessageListMediator extends FlexMediator
	{
		[Inject]
		public var messageList:MessageList;

		[Inject]
		public var messageProxy:MessageProxy;

		public function MessageListMediator()
		{
		}

		override public function onRegisterComplete():void
		{
			messageList.dataProvider = messageProxy.messageList;
		}

	}
}