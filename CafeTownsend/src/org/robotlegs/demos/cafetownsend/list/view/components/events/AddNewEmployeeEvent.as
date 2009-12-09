package org.robotlegs.demos.cafetownsend.list.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class AddNewEmployeeEvent extends CairngormEvent {

		public function AddNewEmployeeEvent() {
			super( AppController.ADD_NEW_EMPLOYEE_EVENT );
			}
		}
	}