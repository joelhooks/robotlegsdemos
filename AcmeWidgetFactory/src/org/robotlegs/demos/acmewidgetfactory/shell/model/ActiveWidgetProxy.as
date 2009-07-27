package org.robotlegs.demos.acmewidgetfactory.shell.model
{
	import org.robotlegs.core.IProxy;
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.utils.NamedObjectMap;
	
	public class ActiveWidgetProxy implements IProxy
	{
		protected var widgetMap:NamedObjectMap;
		
		public function ActiveWidgetProxy()
		{
			widgetMap = new NamedObjectMap();
		}
		
		public function getWidget(id:String):*
		{
			return widgetMap.getObject(id);
		}
		
		public function getWidgetId(widget:IWidgetModule):String
		{
			return widgetMap.getObjectId(widget);
		}
		
		public function hasWidgetId(id:String):Boolean
		{
			return widgetMap.hasObjectId(id);
		}
		
		public function registerWidget(widget:IWidgetModule, id:String):void
		{
			widgetMap.registerObject(widget, id);
		}
		
		public function removeById(id:String):void
		{
			widgetMap.removeById(id);
		}
	
	}
}