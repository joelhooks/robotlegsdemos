package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

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