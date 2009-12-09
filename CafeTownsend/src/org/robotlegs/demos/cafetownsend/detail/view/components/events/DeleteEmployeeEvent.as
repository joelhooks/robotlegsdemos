package org.robotlegs.demos.cafetownsend.detail.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class DeleteEmployeeEvent extends CairngormEvent {

		public function DeleteEmployeeEvent() {
			super( AppController.DELETE_EMPLOYEE_EVENT );
			}
		}
	}