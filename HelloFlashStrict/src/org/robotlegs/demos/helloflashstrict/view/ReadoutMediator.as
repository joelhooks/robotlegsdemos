/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.view
{

import org.robotlegs.demos.helloflashstrict.controller.HelloFlashEvent;
import org.robotlegs.demos.helloflashstrict.model.IBallContainer;
import org.robotlegs.mvcs.Mediator;


public class ReadoutMediator extends Mediator
{
    [Inject]
    public var view:Readout;
    
    [Inject]
    public var container:IBallContainer;
    
    override public function onRegister ():void
    {
        this.eventMap.mapListener
        (
            this.eventDispatcher,
            HelloFlashEvent.BALL_CREATED,
            this.onBallCreated
        );
    }
    
    protected function onBallCreated (event:HelloFlashEvent):void
    {
        this.view.setText("Click count: " + this.container.length);
    }
    
}
}