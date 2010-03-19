package org.robotlegs.demos.cafetownsend.main.model.vo
{
/** @author Jonathan Toland */
public class SystemAlert
{
	
	public function SystemAlert(text:String, title:String, action:Function = null, cancelable:Boolean = false)
	{
		_text = text;
		_title = title;
		_action = action;
		_cancelable = cancelable;
	}
	
	private var _text:String;
	
	public function get text():String
	{
		return _text;
	}
	
	private var _title:String;
	
	public function get title():String
	{
		return _title;
	}
	
	private var _action:Function;
	
	public function get action():Function
	{
		return _action;
	}
	
	private var _cancelable:Boolean;
	
	public function get cancelable():Boolean
	{
		return _cancelable;
	}
	
	public function clone():SystemAlert
	{
		return new SystemAlert(_text, _title, _action, _cancelable);
	}
	
}
}