package org.robotlegs.demos.cafetownsend.list.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class UpdateEmployeeEvent extends CairngormEvent {

		public var selectedItem : Object;

		public function UpdateEmployeeEvent( selectedItem : Object ) {
			super( AppController.UPDATE_EMPLOYEE_EVENT );
			this.selectedItem = selectedItem;
			}
		}
	}