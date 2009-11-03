package org.robotlegs.demos.helloflex
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.demos.helloflex.controller.*;
	import org.robotlegs.demos.helloflex.model.*;
	import org.robotlegs.demos.helloflex.services.*;
	import org.robotlegs.demos.helloflex.view.*;
	import org.robotlegs.mvcs.Context;
	
	public class HelloFlexContext extends Context
	{
		
		public function HelloFlexContext()
		{
			super();
		}
		
		override public function startup():void
		{
			// Controller
			commandMap.mapEvent(SystemEvent.CLEAR_MESSAGES_REQUESTED, TryClearMessages);
			// Model
			injector.mapSingleton(UserProxy);
			injector.mapSingleton(MessageModel);
			// Services
			injector.mapSingletonOf(IAuthService, DummyAuthService);
			// View
			mediatorMap.mapView(HelloForm, HelloFormMediator);
			mediatorMap.mapView(MessageList, MessageListMediator);
			mediatorMap.mapView(ClearMessagesButton, ClearMessagesButtonMediator);
			mediatorMap.mapView(LoginPage, LoginPageMediator);
			mediatorMap.mapView(LogoutButton, LogoutButtonMediator);
			mediatorMap.mapView(SimpleLogBox, SimpleLogBoxMediator);
			// Startup complete
			super.startup();
		}
	
	}
}