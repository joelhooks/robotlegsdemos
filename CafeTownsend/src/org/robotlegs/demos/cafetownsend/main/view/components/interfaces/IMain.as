package org.robotlegs.demos.cafetownsend.main.view.components.interfaces
{
import org.robotlegs.demos.cafetownsend.main.model.vo.SystemAlert;

/** @author Jonathan Toland */
public interface IMain
{
	function set activeViewComponentType(value:Class):void;
	function receiveSystemAlert(systemAlert:SystemAlert):void;
}
}