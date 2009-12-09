package com.adobe.cafetownsend.command {

	import mx.rpc.IResponder;
	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.business.LoadEmployeesDelegate;
	import com.adobe.cafetownsend.model.AppModelLocator;

	public class LoadEmployeesCommand implements Command, IResponder {

		private var model : AppModelLocator = AppModelLocator.getInstance();
		
		public function execute( cgEvent:CairngormEvent ) : void {
			// create a worker who will go get some data
			// pass it a reference to this command so the delegate knows where to return the data
			var delegate : LoadEmployeesDelegate = new LoadEmployeesDelegate( this );
			// make the delegate do some work
			delegate.loadEmployeesService();
			}
		
		// this is called when the delegate receives a result from the service
		public function result( rpcEvent : Object ) : void {
			// populate the employee list in the model locator with the results from the service call
			model.employeeListDP = rpcEvent.result.employees.employee;
			}
		
		// this is called when the delegate receives a fault from the service
		public function fault( rpcEvent : Object ) : void {
			// store an error message in the model locator
			// labels, alerts, etc can bind to this to notify the user of errors
			model.errorStatus = "Fault occured in LoadEmployeesCommand.";
			}
		}
	}