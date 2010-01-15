package org.robotlegs.demos.cafetownsend.user.model.events
{
import flash.events.Event;

import org.robotlegs.demos.cafetownsend.user.model.vo.User;

/** @author Jonathan Toland */
public class EmployeeLoginEvent extends Event
{
	public static const LOGIN:String  = 'login';
	public static const LOGOUT:String  = 'logout';
	public static const USER:String  = 'user';
	public static const HINT:String  = 'hint';
	
	public function EmployeeLoginEvent(type:String, user:User)
	{
		super(type);
		_user = user;
	}
	
	private var _user:User;
	
	public function get user():User
	{
		return _user;
	}
	
	override public function clone():Event
	{
		return new EmployeeLoginEvent(type, _user);
	}
	
}
}