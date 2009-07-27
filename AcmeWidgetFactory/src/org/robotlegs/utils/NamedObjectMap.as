package org.robotlegs.utils
{
	import flash.utils.Dictionary;
	
	public class NamedObjectMap
	{
		protected var objectByKey:Dictionary;
		protected var keyByObject:Dictionary;
		
		public function NamedObjectMap()
		{
			flush();
		}
		
		public function hasObject(object:Object):Boolean
		{
			return keyByObject[object] != null;
		}
		
		public function hasKey(key:String):Boolean
		{
			return objectByKey[key] != null;
		}
		
		public function registerObject(object:Object, key:String):void
		{
			objectByKey[key] = object;
			keyByObject[object] = key;
		}
		
		public function removeByKey(key:String):void
		{
			delete keyByObject[getObject(key)];
			delete objectByKey[key];
		}
		
		public function removeByObject(object:Object):void
		{
			delete objectByKey[getKey(object)];
			delete keyByObject[object];
		}
		
		public function getObject(key:String):*
		{
			return objectByKey[key];
		}
		
		public function getKey(object:Object):String
		{
			return keyByObject[object];
		}
		
		public function flush():void
		{
			objectByKey = new Dictionary();
			keyByObject = new Dictionary();
		}
	}
}