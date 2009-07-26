package org.robotlegs.utils
{
	import flash.utils.Dictionary;
	
	public class NamedObjectMap
	{
		protected var objectById:Dictionary;
		protected var idByObject:Dictionary;
		
		public function NamedObjectMap()
		{
			flush();
		}
		
		public function hasObject(object:Object):Boolean
		{
			return idByObject[object] != null;
		}
		
		public function hasObjectId(id:String):Boolean
		{
			return objectById[id] != null;
		}
		
		public function registerObject(object:Object, id:String):void
		{
			if (hasObject(object))
			{
				throw new Error('Object instance already registered');
			}
			if (hasObjectId(id))
			{
				throw new Error('Id already registered');
			}
			objectById[id] = object;
			idByObject[object] = id;
		}
		
		public function removeById(id:String):void
		{
			if (!hasObjectId(id))
			{
				throw new Error('Object Id does not exist');
			}
			delete idByObject[getObject(id)];
			delete objectById[id];
		}
		
		public function removeByObject(object:Object):void
		{
			if (!hasObject(object))
			{
				throw new Error('Object does not exist');
			}
			delete idByObject[object];
			delete objectById[getObjectId(object)];
		}
		
		public function getObject(id:String):*
		{
			if (!hasObjectId(id))
			{
				throw new Error('Object does not exist');
			}
			return objectById[id];
		}
		
		public function getObjectId(object:Object):String
		{
			if (!hasObject(object))
			{
				throw new Error('Object Id does not exist');
			}
			return idByObject[object];
		}
		
		public function flush():void
		{
			objectById = new Dictionary();
			idByObject = new Dictionary();
		}
	}
}