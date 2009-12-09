package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class LogoutEvent extends CairngormEvent {

		public function LogoutEvent() {
			super( AppController.LOGOUT_EVENT );
			}
		}
	}