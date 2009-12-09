package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class AddNewEmployeeEvent extends CairngormEvent {

		public function AddNewEmployeeEvent() {
			super( AppController.ADD_NEW_EMPLOYEE_EVENT );
			}
		}
	}