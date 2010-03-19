package org.robotlegs.demos.whereswindow.view.mediators
{
	import org.robotlegs.mvcs.Mediator;
	
	public class WindowContentMediator extends Mediator
	{
		public function WindowContentMediator()
		{
			super();
		}
		
		override public function onRegister() : void
		{
			trace("content");
		}
	}
}