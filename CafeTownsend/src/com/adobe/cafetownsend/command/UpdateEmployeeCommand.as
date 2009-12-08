package com.adobe.cafetownsend.command {

	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.UpdateEmployeeEvent;
	import com.adobe.cafetownsend.model.AppModelLocator;
	import com.adobe.cafetownsend.vo.Employee;

	public class UpdateEmployeeCommand implements Command {

		private var model : AppModelLocator = AppModelLocator.getInstance();

		public function execute( cgEvent : CairngormEvent ) : void {
			// cast the caringorm event so we can get at the selectedItem values sent from the mx:List
			var selectedItem : Object = UpdateEmployeeEvent( cgEvent ).selectedItem;
			
			// populate a temp employee in the model locator with the details from the selectedItem
			model.employeeTemp = new Employee(	selectedItem.emp_id,
												selectedItem.firstname,
												selectedItem.lastname,
												selectedItem.email,
												new Date(Date.parse(selectedItem.startdate)) );

			// main viewstack selectedIndex is bound to this model locator value
			// so this now switches the view from the employee list to the detail screen
			model.viewing = AppModelLocator.EMPLOYEE_DETAIL;
			}
		}
	}