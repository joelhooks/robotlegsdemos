/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.remote.services
{
	public interface IGalleryImageService
	{
		function loadGallery():void;
		function search(searchTerm:String):void;
		function get searchAvailable():Boolean;
	}
}