package com.adobe.cafetownsend.command {

	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.model.AppModelLocator;

	public class DeleteEmployeeCommand implements Command {

		private var model : AppModelLocator = AppModelLocator.getInstance();

		public function execute( cgEvent : CairngormEvent ) : void {
			// loop thru the employee list in the model locator
			for ( var i : uint = 0; i < model.employeeListDP.length; i++ ) {
				// if the emp_id stored in the temp employee matches one of the emp_id's in the employee list
				if ( model.employeeTemp.emp_id == model.employeeListDP[i].emp_id ) {
					// remove that item from the ArrayCollection
					model.employeeListDP.removeItemAt( i );
					}
				}
				
			// clear out the data stored in the temp employee
			model.employeeTemp = null;
			
			// main viewstack selectedIndex is bound to this model locator value
			// so this now switches the view from the detail screen back to the employee list
			// the list should be one array item shorter
			model.viewing = AppModelLocator.EMPLOYEE_LIST;
			}
		}
	}