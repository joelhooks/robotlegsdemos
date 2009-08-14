package org.robotlegs.demos.whereswindow.view.mediators
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.events.IndexChangedEvent;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.demos.whereswindow.events.InfoWindowEvent;
	import org.robotlegs.demos.whereswindow.model.OpenWindowsProxy;
	import org.robotlegs.demos.whereswindow.view.components.InfoWindow;
	import org.robotlegs.demos.whereswindow.view.components.OpenWindowList;
	import org.robotlegs.mvcs.Mediator;

	public class OpenWindowsListMediator extends Mediator implements IMediator
	{
		[Inject]
		public var openWindowsProxy:OpenWindowsProxy;
		
		protected var currentSelection:InfoWindow;
		
		public function OpenWindowsListMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			addEventListenerTo( eventDispatcher, InfoWindowEvent.INFO_WINDOW_ADDED, handleWindowAdded );
			addEventListenerTo( view, IndexChangedEvent.SELECTION_CHANGED, handleItemChanged );
			addEventListenerTo( eventDispatcher, InfoWindowEvent.INFO_WINDOW_REMOVED, handleWindowClosed );
		}
		
		protected function handleWindowClosed(event:InfoWindowEvent):void
		{
			openWindowsProxy.updateCollection( ArrayCollection( view.dataProvider ) );
		}
		
		protected function handleWindowAdded(event:InfoWindowEvent):void
		{
			if(view.dataProvider is ArrayCollection)
			{
				openWindowsProxy.updateCollection(ArrayCollection(view.dataProvider));
			}
			else
			{
				view.dataProvider = openWindowsProxy.getAllWindows();
			}
		}
		
		protected function handleItemChanged(event:Event):void
		{
			if(view.selectedItem != this.currentSelection && view.selectedItem is InfoWindow)
			{
				dispatch( new InfoWindowEvent( InfoWindowEvent.FLASH_INFO_WINDOW, view.selectedItem.id ) );
				this.currentSelection = InfoWindow(view.selectedItem);
			}
		}
		
		protected function get view():OpenWindowList
		{
			return viewComponent as OpenWindowList;
		}
	}
}