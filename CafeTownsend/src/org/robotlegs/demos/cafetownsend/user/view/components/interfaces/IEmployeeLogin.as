package org.robotlegs.demos.cafetownsend.user.view.components.interfaces
{
import flash.events.IEventDispatcher;

import mx.validators.IValidatorListener;

[Event(name="login", type="org.robotlegs.demos.cafetownsend.user.model.events.EmployeeLoginEvent")]
/** @author Jonathan Toland */
public interface IEmployeeLogin extends IEventDispatcher
{
	function get usernameValidatorSource():IValidatorListener;
	function get passwordValidatorSource():IValidatorListener;
	function get usernameValidatorProperty():String;
	function get passwordValidatorProperty():String;
	function set hint(value:String):void;
	function resetFocus():void;
}
}