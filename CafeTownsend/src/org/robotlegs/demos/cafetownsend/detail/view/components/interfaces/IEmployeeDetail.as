package org.robotlegs.demos.cafetownsend.detail.view.components.interfaces
{
import flash.events.IEventDispatcher;

import mx.validators.IValidatorListener;

import org.robotlegs.demos.cafetownsend.detail.model.vo.Employee;

[Event(name="abort", type="org.robotlegs.demos.cafetownsend.detail.model.events.EmployeeDetailEvent")]
[Event(name="commit", type="org.robotlegs.demos.cafetownsend.detail.model.events.EmployeeDetailEvent")]
[Event(name="remove", type="org.robotlegs.demos.cafetownsend.list.model.events.EmployeeListEvent")]
/** @author Jonathan Toland */
public interface IEmployeeDetail extends IEventDispatcher
{
	function get firstNameValidatorSource():IValidatorListener;
	function get lastNameValidatorSource():IValidatorListener;
	function get emailValidatorSource():IValidatorListener;
	function get firstNameValidatorProperty():String;
	function get lastNameValidatorProperty():String;
	function get emailValidatorProperty():String;
	function set employee(value:Employee):void;
}
}