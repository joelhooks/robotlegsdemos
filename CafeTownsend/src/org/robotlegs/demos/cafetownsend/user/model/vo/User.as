package org.robotlegs.demos.cafetownsend.user.model.vo
{
/** @author Jonathan Toland */
public class User
{
	
	public function User(username:String, password:String)
	{
		_username = username;
		_password = password;
	}
	
	private var _username:String;
	
	public function get username():String
	{
		return _username;
	}
	
	private var _password:String;
	
	public function get password():String
	{
		return _password;
	}
	
	public function clone():User
	{
		return new User(_username, _password);
	}
	
}
}