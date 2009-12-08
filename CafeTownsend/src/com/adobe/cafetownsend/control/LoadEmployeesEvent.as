package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.CairngormEvent;
	import com.adobe.cafetownsend.control.AppController;

	public class LoadEmployeesEvent extends CairngormEvent {

		public function LoadEmployeesEvent() {
			super( AppController.LOAD_EMPLOYEES_EVENT );
			}
		}
	}