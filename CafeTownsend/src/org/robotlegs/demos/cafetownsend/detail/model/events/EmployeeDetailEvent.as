package org.robotlegs.demos.cafetownsend.detail.model.events
{
import flash.events.Event;

import org.robotlegs.demos.cafetownsend.detail.model.vo.Employee;

/** @author Jonathan Toland */
public class EmployeeDetailEvent extends Event
{
	public static const EDIT:String = 'edit';
	public static const ABORT:String = 'abort';
	public static const COMMIT:String = 'commit';
	
	public function EmployeeDetailEvent(type:String, employee:Employee)
	{
		super(type);
		_employee = employee;
	}
	
	private var _employee:Employee;
	
	public function get employee():Employee
	{
		return _employee;
	}
	
	override public function clone():Event
	{
		return new EmployeeDetailEvent(type, _employee);
	}
	
}
}