package org.robotlegs.demos.cafetownsend.list.model.events
{
import org.robotlegs.demos.cafetownsend.detail.model.events.EmployeeDetailEvent;
import org.robotlegs.demos.cafetownsend.detail.model.vo.Employee;

/** @author Jonathan Toland */
public class EmployeeListEvent extends EmployeeDetailEvent
{
	public static const ADD:String = 'add';
	public static const UPDATE:String = 'update';
	public static const REMOVE:String = 'remove';
	
	public function EmployeeListEvent(type:String, employee:Employee)
	{
		super(type, employee);
	}
	
}
}