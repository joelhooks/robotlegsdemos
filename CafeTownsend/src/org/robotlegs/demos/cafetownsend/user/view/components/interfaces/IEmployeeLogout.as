package org.robotlegs.demos.cafetownsend.user.view.components.interfaces
{
import flash.events.IEventDispatcher;

[Event(name="logout", type="org.robotlegs.demos.cafetownsend.user.model.events.EmployeeLoginEvent")]
/** @author Jonathan Toland */
public interface IEmployeeLogout extends IEventDispatcher
{
}
}