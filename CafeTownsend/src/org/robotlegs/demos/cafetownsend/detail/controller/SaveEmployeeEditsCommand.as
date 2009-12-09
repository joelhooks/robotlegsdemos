package com.adobe.cafetownsend.command {

	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.model.AppModelLocator;
	import com.adobe.cafetownsend.control.SaveEmployeeEditsEvent;

	public class SaveEmployeeEditsCommand implements Command {

		private var model : AppModelLocator = AppModelLocator.getInstance();

		public function execute( cgEvent : CairngormEvent ) : void {
			// cast the cairngorm event and extract the edited employee data fields
			var editItems : SaveEmployeeEditsEvent = SaveEmployeeEditsEvent( cgEvent );
			// store those values in the temp employee in the model locator
			model.employeeTemp.emp_id = editItems.emp_id;
			model.employeeTemp.firstname = editItems.firstname;
			model.employeeTemp.lastname = editItems.lastname;
			model.employeeTemp.startdate = editItems.startdate;
			model.employeeTemp.email = editItems.email;

			// assume the edited fields are not an existing employee, but a new employee
			// and set the ArrayCollection index to -1, which means this employee is not in our existing
			// employee list anywhere
			var dpIndex : int = -1;
			
			// loop thru the employee list
			for ( var i : uint = 0; i < model.employeeListDP.length; i++ ) {
				// if the emp_id of the incoming employee matches an employee already in the list
				if ( model.employeeListDP[i].emp_id == model.employeeTemp.emp_id ) {
					// set our ArrayCollection index to that employee position
					dpIndex = i;
					}
				}

			// if it was an existing employee already in the ArrayCollection
			if ( dpIndex >= 0 ) {
				// update that employee's values
				model.employeeListDP.setItemAt( model.employeeTemp, dpIndex );
				}
			// otherwise, if it didn't match any existing employees
			else {
				// add the temp employee to the ArrayCollection
				model.employeeListDP.addItem( model.employeeTemp );
				}
			
			// now that we've trasferred the temp employee to the array we can clear out the temp employee
			model.employeeTemp = null;
			
			// main viewstack selectedIndex is bound to this model locator value
			// so this now switches the view from the detail screen back to the employee list
			// the employee list should now contain one more item
			model.viewing = AppModelLocator.EMPLOYEE_LIST;
			}
		}
	}