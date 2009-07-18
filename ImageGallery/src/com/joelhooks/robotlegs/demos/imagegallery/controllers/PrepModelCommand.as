/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery
	
	Any portion of this demonstration may be reused for any purpose where not 
	licensed by another party restricting such use. Please leave the credits intact.
	
	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com 
*/
package com.joelhooks.robotlegs.demos.imagegallery.controllers
{
	import com.joelhooks.robotlegs.demos.imagegallery.models.proxies.GalleryProxy;
	
	import net.boyblack.robotlegs.core.ICommand;
	import net.boyblack.robotlegs.mvcs.Command;

	public class PrepModelCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			injector.bindSingleton( GalleryProxy );
		}
	}
}