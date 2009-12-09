package com.adobe.cafetownsend.control {

	import com.adobe.cairngorm.control.FrontController;
	import com.adobe.cafetownsend.command.*;

	public class AppController extends FrontController {

		public static const LOAD_EMPLOYEES_EVENT : String =			"LOAD_EMPLOYEES_EVENT";
		public static const LOGIN_EMPLOYEE_EVENT : String =			"LOGIN_EMPLOYEE_EVENT";
		public static const ADD_NEW_EMPLOYEE_EVENT : String =		"ADD_NEW_EMPLOYEE_EVENT";
		public static const UPDATE_EMPLOYEE_EVENT : String =		"UPDATE_EMPLOYEE_EVENT";
		public static const LOGOUT_EVENT : String =					"LOGOUT_EVENT";
		public static const CANCEL_EMPLOYEE_EDITS_EVENT : String =	"CANCEL_EMPLOYEE_EDITS_EVENT";
		public static const DELETE_EMPLOYEE_EVENT : String =		"DELETE_EMPLOYEE_EVENT";
		public static const SAVE_EMPLOYEE_EDITS_EVENT : String =	"SAVE_EMPLOYEE_EDITS_EVENT";

		public function AppController() {
			addCommand( AppController.LOAD_EMPLOYEES_EVENT, LoadEmployeesCommand );
			addCommand( AppController.LOGIN_EMPLOYEE_EVENT, LoginEmployeeCommand );
			addCommand( AppController.ADD_NEW_EMPLOYEE_EVENT, AddNewEmployeeCommand );
			addCommand( AppController.UPDATE_EMPLOYEE_EVENT, UpdateEmployeeCommand );
			addCommand( AppController.LOGOUT_EVENT, LogoutCommand );
			addCommand( AppController.CANCEL_EMPLOYEE_EDITS_EVENT, CancelEmployeeEditsCommand );
			addCommand( AppController.DELETE_EMPLOYEE_EVENT, DeleteEmployeeCommand );
			addCommand( AppController.SAVE_EMPLOYEE_EDITS_EVENT, SaveEmployeeEditsCommand );
			}
		}
	}