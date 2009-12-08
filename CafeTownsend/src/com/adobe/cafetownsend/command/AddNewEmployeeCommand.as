package com.adobe.cafetownsend.command {

	import com.adobe.cairngorm.commands.Command;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.model.AppModelLocator;
	import com.adobe.cafetownsend.vo.Employee;

	public class AddNewEmployeeCommand implements Command {

		private var model : AppModelLocator = AppModelLocator.getInstance();

		public function execute( cgEvent : CairngormEvent ) : void {
			// add new employee instantiates a new employee object, which has default blank values in the constructor
			model.employeeTemp = new Employee();
			
			// main viewstack selectedIndex is bound to this model locator value
			// so this now switches the view from the employee list to the detail screen
			// so we can populate the new blank employee values
			model.viewing = AppModelLocator.EMPLOYEE_DETAIL;
			}
		}
	}