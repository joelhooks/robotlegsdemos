package org.robotlegs.demos.cafetownsend.user.model
{
import org.robotlegs.demos.cafetownsend.user.model.events.EmployeeLoginEvent;
import org.robotlegs.demos.cafetownsend.user.model.vo.User;
import org.robotlegs.mvcs.Actor;

/** @author Jonathan Toland */
public class EmployeeLoginModel extends Actor
{
	private var _user:User;
	
	public function get user():User
	{
		return _user;
	}
	
	public function set user(value:User):void
	{
		_user = value;
		dispatch(new EmployeeLoginEvent(EmployeeLoginEvent.USER, value && value.clone()));
	}
	
	private var _hint:String;
	
	public function get hint():String
	{
		return _hint;
	}
	
	public function set hint(value:String):void
	{
		_hint = value;
		dispatch(new EmployeeLoginEvent(EmployeeLoginEvent.HINT, null));
	}
	
}
}