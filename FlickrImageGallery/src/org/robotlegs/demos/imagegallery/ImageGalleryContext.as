/*
   Inversion of Control/Dependency Injection Using Robotlegs
   Image Gallery

   Any portion of this demonstration may be reused for any purpose where not
   licensed by another party restricting such use. Please leave the credits intact.

   Joel Hooks
   http://joelhooks.com
   joelhooks@gmail.com
 */
package org.robotlegs.demos.imagegallery
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.demos.imagegallery.controllers.StartupCommand;
	import org.robotlegs.demos.imagegallery.controllers.gallery.*;
	import org.robotlegs.demos.imagegallery.events.*;
	import org.robotlegs.demos.imagegallery.models.GalleryModel;
	import org.robotlegs.demos.imagegallery.remote.services.*;
	import org.robotlegs.demos.imagegallery.views.components.*;
	import org.robotlegs.demos.imagegallery.views.events.GallerySearchEvent;
	import org.robotlegs.demos.imagegallery.views.mediators.*;
	import org.robotlegs.mvcs.Context;

	public class ImageGalleryContext extends Context
	{
		public function ImageGalleryContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			//map controller
			commandMap.mapEvent(StartupCommand, ContextEvent.STARTUP, ContextEvent, true);
			commandMap.mapEvent(UpdateGalleryCommand, GalleryEvent.GALLERY_LOADED, GalleryEvent);
			commandMap.mapEvent(SetSelectedImageCommand,GalleryImageEvent.SELECT_GALLERY_IMAGE, GalleryImageEvent);
			commandMap.mapEvent(LoadGalleryCommand,GalleryEvent.LOAD_GALLERY, GalleryEvent);
			commandMap.mapEvent(LoadSearchGalleryCommand,GallerySearchEvent.SEARCH, GallerySearchEvent);
			
			//map model
			injector.mapSingleton( GalleryModel );
			
			//map service
			injector.mapSingletonOf( IGalleryImageService, FlickrImageService );
			//injector.mapSingletonOf( IGalleryImageService, XMLImageService );
			
			//map view
			mediatorMap.mapView(GalleryView, GalleryViewMediator);
			mediatorMap.mapView(GallerySearch, GallerySearchMediator);
			mediatorMap.mapView(GalleryLabel, GalleryLabelMediator);
						
			// And away we go!
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}