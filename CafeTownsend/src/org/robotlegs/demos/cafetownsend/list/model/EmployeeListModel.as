package org.robotlegs.demos.cafetownsend.list.model
{
import flash.utils.Dictionary;

import org.robotlegs.demos.cafetownsend.detail.model.vo.Employee;
import org.robotlegs.demos.cafetownsend.list.model.events.EmployeeListEvent;
import org.robotlegs.mvcs.Actor;

/** @author Jonathan Toland */
public class EmployeeListModel extends Actor
{
	private const employeeMap:Dictionary = new Dictionary(false);
	
	private var _autoIncrementEmployeeID:uint = 0x400;
	
	public function get autoIncrementEmployeeID():uint
	{
		while (_autoIncrementEmployeeID in employeeMap)
		{
			_autoIncrementEmployeeID++;
		}
		return _autoIncrementEmployeeID;
	}
	
	public function getEmployeeByID(id:uint):Employee
	{
		return employeeMap[id];
	}
	
	public function unmapEmployee(employee:Employee):void
	{
		delete employeeMap[employee.id];
		dispatch(new EmployeeListEvent(EmployeeListEvent.REMOVE, employee.clone()));
	}
	
	public function mapEmployee(employee:Employee):void
	{
		const eventType:String = (employee.id in employeeMap) ? EmployeeListEvent.UPDATE : EmployeeListEvent.ADD;
		if (!employee.id)
		{
			employee = employee.clone(autoIncrementEmployeeID);
		}
		employeeMap[employee.id] = employee;
		dispatch(new EmployeeListEvent(eventType, employee.clone()));
	}
	
}
}