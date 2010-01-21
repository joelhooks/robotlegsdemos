package org.robotlegs.demos.cafetownsend.detail.model.vo
{
/** @author Jonathan Toland */
public class Employee
{
	
	public function Employee(firstName:String, lastName:String, email:String, startDate:Date, id:uint = 0)
	{
		_id = id;
		_firstName = firstName;
		_lastName = lastName;
		_email = email;
		_startDate = startDate;
	}
	
	private var _id:uint;
	
	public function get id():uint
	{
		return _id;
	}
	
	private var _firstName:String;
	
	public function get firstName():String
	{
		return _firstName;
	}
	
	private var _lastName:String;
	
	public function get lastName():String
	{
		return _lastName;
	}
	
	private var _email:String;
	
	public function get email():String
	{
		return _email;
	}
	
	private var _startDate:Date;
	
	public function get startDate():Date
	{
		return _startDate;
	}
	
	public function clone(newID:uint = 0):Employee
	{
		return new Employee(_firstName, _lastName, _email, _startDate, newID || _id);
	}
	
}
}