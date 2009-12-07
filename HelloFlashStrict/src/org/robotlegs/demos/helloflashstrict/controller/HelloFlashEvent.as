/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.controller
{

import flash.events.Event;

import org.robotlegs.demos.helloflashstrict.model.IBallVO;


public class HelloFlashEvent extends Event
{
    
    public static const BALL_CLICKED:String = "ball_clicked";
    public static const BALL_CREATED:String = "ball_created";
    
    public function HelloFlashEvent(type:String, ball:IBallVO = null)
    {
        super(type);
        
        this._ball = ball;
    }
    
    private var _ball:IBallVO;
    
    public function get ball ():IBallVO
    {
        return this._ball;
    }
    
    override public function clone():Event
    {
        return new HelloFlashEvent(this.type, this.ball);
    }
    
}
}
