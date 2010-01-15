package org.robotlegs.demos.cafetownsend.detail.model
{
import org.robotlegs.demos.cafetownsend.detail.model.events.EmployeeDetailEvent;
import org.robotlegs.demos.cafetownsend.detail.model.vo.Employee;
import org.robotlegs.mvcs.Actor;

/** @author Jonathan Toland */
public class EmployeeDetailModel extends Actor
{
	private var _employee:Employee;
	
	public function get employee():Employee
	{
		return _employee;
	}
	
	public function set employee(value:Employee):void
	{
		_employee = value;
		dispatch(new EmployeeDetailEvent(EmployeeDetailEvent.EDIT, value && value.clone()));
	}
	
}
}