package org.robotlegs.demos.cafetownsend.user.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class LogoutEvent extends CairngormEvent {

		public function LogoutEvent() {
			super( AppController.LOGOUT_EVENT );
			}
		}
	}