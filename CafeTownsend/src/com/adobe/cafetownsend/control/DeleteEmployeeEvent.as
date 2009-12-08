package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class DeleteEmployeeEvent extends CairngormEvent {

		public function DeleteEmployeeEvent() {
			super( AppController.DELETE_EMPLOYEE_EVENT );
			}
		}
	}