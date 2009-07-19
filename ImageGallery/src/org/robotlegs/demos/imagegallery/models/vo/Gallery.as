/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package org.robotlegs.demos.imagegallery.models.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class Gallery
	{
		public var photos:ArrayCollection = new ArrayCollection()
	}
}