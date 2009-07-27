package org.robotlegs.demos.acmewidgetfactory.shell.model
{
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	
	import org.robotlegs.demos.acmewidgetfactory.common.interfaces.IWidgetModule;
	import org.robotlegs.demos.acmewidgetfactory.shell.events.ShellWidgetEvent;
	import org.robotlegs.mvcs.Proxy;
	import org.robotlegs.utils.NamedObjectMap;
	
	public class ActiveWidgetProxy extends Proxy
	{
		private static const MODULE_URL:String = 'org/robotlegs/demos/acmewidgetfactory/modules/widget/WidgetModule.swf';
		
		protected var widgetMap:NamedObjectMap;
		protected var loadedModuleInfo:IModuleInfo;
		
		public function ActiveWidgetProxy()
		{
			widgetMap = new NamedObjectMap();
		}
		
		public function createWidget(id:String):void
		{
			if (widgetMap.hasKey(id) == false)
			{
				loadModule(id);
			}
		}
		
		public function getWidget(id:String):IWidgetModule
		{
			return widgetMap.getObject(id) as IWidgetModule;
		}
		
		public function getWidgetId(widget:IWidgetModule):String
		{
			return widgetMap.getKey(widget);
		}
		
		public function hasWidgetId(id:String):Boolean
		{
			return widgetMap.hasKey(id);
		}
		
		public function removeById(id:String):void
		{
			widgetMap.removeByKey(id);
		}
		
		protected function createModule(id:String):void
		{
			widgetMap.registerObject(loadedModuleInfo.factory.create(), id);
			dispatch(new ShellWidgetEvent(ShellWidgetEvent.CREATE_WIDGET_COMPLETE, id));
		}
		
		protected function loadModule(id:String):void
		{
			if (loadedModuleInfo)
			{
				createModule(id);
			}
			else
			{
				var info:IModuleInfo = ModuleManager.getModule(MODULE_URL);
				info.data = id;
				info.addEventListener(ModuleEvent.PROGRESS, onModuleProgress);
				info.addEventListener(ModuleEvent.READY, onModuleReady);
				info.addEventListener(ModuleEvent.ERROR, onModuleError);
				widgetMap.registerObject(info, id);
				info.load();
			}
		}
		
		protected function onModuleReady(e:ModuleEvent):void
		{
			loadedModuleInfo = e.module;
			createModule(e.module.data as String);
		}
		
		protected function onModuleError(e:ModuleEvent):void
		{
			// TODO...
			trace(e.errorText);
		}
		
		protected function onModuleProgress(e:ModuleEvent):void
		{
			// TODO...
		}
	
	}
}