package org.robotlegs.demos.cafetownsend.detail.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class CancelEmployeeEditsEvent extends CairngormEvent {

		public function CancelEmployeeEditsEvent() {
			super( AppController.CANCEL_EMPLOYEE_EDITS_EVENT );
			}
		}
	}