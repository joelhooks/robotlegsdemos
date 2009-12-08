package com.adobe.cafetownsend.business {

	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import com.adobe.cairngorm.business.ServiceLocator;

	public class LoadEmployeesDelegate {

		private var command : IResponder;
		private var service : Object;

		public function LoadEmployeesDelegate( command : IResponder ) {
			// constructor will store a reference to the service we're going to call
			this.service = ServiceLocator.getInstance().getHTTPService( 'loadEmployeesService' );
			// and store a reference to the command that created this delegate
			this.command = command;
			}

		public function loadEmployeesService() : void {
			// call the service
			var token:AsyncToken = service.send();
			// notify this command when the service call completes
			token.addResponder( command );
			}
		}
	}