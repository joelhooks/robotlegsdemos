package com.adobe.cafetownsend.command {

	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.LoginEmployeeEvent;
	import com.adobe.cafetownsend.model.AppModelLocator;
	import mx.controls.Alert;
	import com.adobe.cafetownsend.vo.User;

	public class LoginEmployeeCommand implements Command {

		private var model : AppModelLocator = AppModelLocator.getInstance();

		public function execute( cgEvent : CairngormEvent ) : void {
			// after casting, retreive the username & password payload from the incoming event
			var username : String = LoginEmployeeEvent( cgEvent ).username;
			var password : String = LoginEmployeeEvent( cgEvent ).password;
			
			// if the auth info is correct
			if ( username == "Flex" && password == "Cairngorm" ) {
				// store the user info in a new user object in the model locator
				model.user = new User( username, password );

				// main viewstack selectedIndex is bound to this model locator value
				// so this now switches the view from the login screen to the employee list
				model.viewing = AppModelLocator.EMPLOYEE_LIST;
				}
			else {
				// if the auth info was incorrect, prompt with an alert box and remain on the login screen
				Alert.show( "We couldn't validate your username & password. Please try again.","Login Failed" );
				}
			}
		}
	}