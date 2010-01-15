package org.robotlegs.demos.cafetownsend.main.model.events
{
import flash.events.Event;

/** @author Jonathan Toland */
public class MainEvent extends Event
{
	public static const FOCUS:String = 'focus';
	
	public function MainEvent(type:String, viewComponentType:Class)
	{
		super(type);
		_viewComponentType = viewComponentType;
	}
	
	private var _viewComponentType:Class;
	
	public function get viewComponentType():Class
	{
		return _viewComponentType;
	}
	
	override public function clone():Event
	{
		return new MainEvent(type, _viewComponentType);
	}
	
}
}