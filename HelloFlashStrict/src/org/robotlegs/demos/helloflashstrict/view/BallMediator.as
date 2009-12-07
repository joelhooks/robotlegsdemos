/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.view
{

import flash.events.MouseEvent;

import org.robotlegs.demos.helloflashstrict.controller.HelloFlashEvent;
import org.robotlegs.mvcs.Mediator;


public class BallMediator extends Mediator
{
    
    [Inject]
    public var view:Ball;
    
    override public function onRegister ():void
    {
        this.eventMap.mapListener(this.view, MouseEvent.CLICK, this.onClick);
        this.eventMap.mapListener(this.eventDispatcher, HelloFlashEvent.BALL_CREATED, this.onSomeBallClicked);
    }
    
    protected function onClick (event:MouseEvent):void
    {
        this.dispatch(new HelloFlashEvent(HelloFlashEvent.BALL_CLICKED));
    }
    
    protected function onSomeBallClicked (event:HelloFlashEvent):void
    {
        this.view.poke();
    }

}
}
