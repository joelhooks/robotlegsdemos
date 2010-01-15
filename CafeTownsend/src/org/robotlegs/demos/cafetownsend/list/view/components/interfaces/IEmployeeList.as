package org.robotlegs.demos.cafetownsend.list.view.components.interfaces
{
import mx.collections.IList;

import org.robotlegs.demos.cafetownsend.user.view.components.interfaces.IEmployeeLogout;

[Event(name="edit", type="org.robotlegs.demos.cafetownsend.detail.model.events.EmployeeDetailEvent")]
/** @author Jonathan Toland */
public interface IEmployeeList extends IEmployeeLogout
{
	function get collection():IList
	function set itemLabelFunction(value:Function):void;
	function clearSelectedEmployee():void;
}
}