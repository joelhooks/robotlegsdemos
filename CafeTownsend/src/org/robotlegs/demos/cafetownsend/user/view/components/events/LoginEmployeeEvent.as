package org.robotlegs.demos.cafetownsend.user.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class LoginEmployeeEvent extends CairngormEvent {
		
		public var username : String;
		public var password : String;

		public function LoginEmployeeEvent( username : String, password : String ) {
			super( AppController.LOGIN_EMPLOYEE_EVENT );
			this.username = username;
			this.password = password;
			}
		}
	}