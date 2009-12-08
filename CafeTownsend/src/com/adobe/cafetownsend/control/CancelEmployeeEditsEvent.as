package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class CancelEmployeeEditsEvent extends CairngormEvent {

		public function CancelEmployeeEditsEvent() {
			super( AppController.CANCEL_EMPLOYEE_EDITS_EVENT );
			}
		}
	}