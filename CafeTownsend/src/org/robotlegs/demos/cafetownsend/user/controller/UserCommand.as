package org.robotlegs.demos.cafetownsend.user.controller
{
import org.robotlegs.demos.cafetownsend.list.view.components.interfaces.IEmployeeList;
import org.robotlegs.demos.cafetownsend.main.model.events.MainEvent;
import org.robotlegs.demos.cafetownsend.user.service.interfaces.IEmployeeLoginService;
import org.robotlegs.demos.cafetownsend.user.view.components.interfaces.IEmployeeLogin;
import org.robotlegs.mvcs.Command;

/** @author Jonathan Toland */
public class UserCommand extends Command
{
	[Inject]
	public var employeeLoginService:IEmployeeLoginService;
	
	override public function execute():void
	{
		dispatch(new MainEvent(MainEvent.FOCUS, employeeLoginService.loggedIn ? IEmployeeList : IEmployeeLogin));
	}
	
}
}