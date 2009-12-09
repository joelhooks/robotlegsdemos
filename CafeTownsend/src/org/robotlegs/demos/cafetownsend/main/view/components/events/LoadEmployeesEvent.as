package org.robotlegs.demos.cafetownsend.main.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class LoadEmployeesEvent extends CairngormEvent {

		public function LoadEmployeesEvent() {
			super( AppController.LOAD_EMPLOYEES_EVENT );
			}
		}
	}