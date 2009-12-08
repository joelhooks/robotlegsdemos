package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class UpdateEmployeeEvent extends CairngormEvent {

		public var selectedItem : Object;

		public function UpdateEmployeeEvent( selectedItem : Object ) {
			super( AppController.UPDATE_EMPLOYEE_EVENT );
			this.selectedItem = selectedItem;
			}
		}
	}