/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.model
{

import org.robotlegs.demos.helloflashstrict.controller.HelloFlashEvent;
import org.robotlegs.mvcs.Actor;


public class BallContainer extends Actor implements IBallContainer
{
    
    public function BallContainer ()
    {
        this.init();
    }
    
    private var array:Array;
    
    public function add (ball:IBallVO):void
    {
        this.array.push(ball);
        
        this.dispatch(new HelloFlashEvent(HelloFlashEvent.BALL_CREATED, ball));
    }
    
    public function get length ():int
    {
        return this.array.length;
    }
    
    private function init ():void
    {
        this.array = [];
    }

}
}
