package org.robotlegs.demos.whereswindow.model
{
	import com.ericfeminella.collections.HashMap;
	import com.ericfeminella.collections.IMap;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Proxy to keep track of current open <code>InfoWindow</code> objects
	 * @author joel
	 *
	 */
	public class OpenWindowsProxy extends Actor
	{
		/**
		 * Hash of currently open windows
		 */
		protected var windowMap:IMap;
		
		public function OpenWindowsProxy()
		{
			windowMap = new HashMap();
		}
		
		/**
		 * Create a new <code>InfoWindow</code>. If the <code>windowMap</code>
		 * already contains a window with the specified UID, return that window
		 * instead
		 *
		 * @param uid identifies the window
		 * @return
		 *
		 */
		public function createWindow(uid:String = null):InfoWindow
		{
			var infoWindow:InfoWindow;
			
			if (this.hasWindowUID(uid))
			{
				infoWindow = this.getWindowFromUID(uid);
				return infoWindow
			}
			
			if (!uid)
				uid = UIDUtil.createUID();
			
			infoWindow = new InfoWindow();
			infoWindow.id = uid;
			this.windowMap.put(infoWindow.id, infoWindow);
			dispatch(new InfoWindowEvent(InfoWindowEvent.INFO_WINDOW_ADDED, uid));
			return infoWindow;
		}
		
		/**
		 * Retrieve an <code>InfoWindow</code> by its unique identifier
		 *
		 * @param uid
		 * @return
		 *
		 */
		public function getWindowFromUID(uid:String):InfoWindow
		{
			return this.windowMap.getValue(uid) as InfoWindow;
		}
		
		/**
		 * Remove a <code>InfoWindow</code> from the <code>windowMap</code>
		 * by its unique identifier.
		 *
		 * @param uid
		 *
		 */
		public function removeWindowByUID(uid:String):void
		{
			this.windowMap.remove(uid);
			dispatch(new InfoWindowEvent(InfoWindowEvent.INFO_WINDOW_REMOVED, uid));
		}
		
		/**
		 * Check if the <code>windowMap</code> contains an <code>InfoWindow</code>
		 * unique identifier as a key.
		 *
		 * @param uid
		 * @return
		 *
		 */
		public function hasWindowUID(uid:String):Boolean
		{
			return this.windowMap.containsKey(uid);
		}
		
		public function updateCollection(collection:ArrayCollection):void
		{
			var windows:Array = this.windowMap.getValues();
			var infoWindow:InfoWindow;
			trace("currently registered:", windows);
			for each (infoWindow in windows)
			{
				if (collection.getItemIndex(infoWindow) < 0)
					collection.addItem(infoWindow);
			}
			
			for each (infoWindow in collection)
			{
				if (!this.windowMap.containsValue(infoWindow))
					collection.removeItemAt(collection.getItemIndex(infoWindow));
			}
		}
		
		public function getAllWindows():ArrayCollection
		{
			return new ArrayCollection(this.windowMap.getValues());
		}
	}
}