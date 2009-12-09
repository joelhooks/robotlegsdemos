package org.robotlegs.demos.cafetownsend.detail.view.components.events {

	import com.adobe.cairngorm.control.CairngormEvent;
	
	import org.robotlegs.demos.cafetownsend.AppController;

	public class SaveEmployeeEditsEvent extends CairngormEvent {
		
		public var emp_id : Number;
		public var firstname : String;
		public var lastname : String;
		public var startdate : Date;
		public var email : String;

		public function SaveEmployeeEditsEvent(	emp_id : Number,
												firstname : String,
												lastname : String,
												startdate : Date,
												email : String
												) {
			super( AppController.SAVE_EMPLOYEE_EDITS_EVENT );
			this.emp_id = emp_id;
			this.firstname = firstname;
			this.lastname = lastname;
			this.startdate = startdate;
			this.email = email;
			}
		}
	}