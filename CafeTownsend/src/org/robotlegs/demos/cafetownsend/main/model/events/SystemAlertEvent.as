package org.robotlegs.demos.cafetownsend.main.model.events
{
import flash.events.Event;

import org.robotlegs.demos.cafetownsend.main.model.vo.SystemAlert;

/** @author Jonathan Toland */
public class SystemAlertEvent extends Event
{
	public static const ALERT:String = 'alert';
	
	public function SystemAlertEvent(type:String, systemAlert:SystemAlert)
	{
		super(type);
		_systemAlert = systemAlert;
	}
	
	private var _systemAlert:SystemAlert;
	
	public function get systemAlert():SystemAlert
	{
		return _systemAlert;
	}
	
	override public function clone():Event
	{
		return new SystemAlertEvent(type, _systemAlert);
	}
	
}
}