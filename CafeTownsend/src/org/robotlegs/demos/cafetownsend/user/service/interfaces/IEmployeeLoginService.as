package org.robotlegs.demos.cafetownsend.user.service.interfaces
{
import org.robotlegs.demos.cafetownsend.user.model.vo.User;

/** @author Jonathan Toland */
public interface IEmployeeLoginService
{
	function get loggedIn():Boolean;
	function logIn(user:User):void;
	function logOut():void;
	function loadHint():void;
}
}