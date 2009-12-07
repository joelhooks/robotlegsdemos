/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.view
{

import flash.display.Sprite;


public class Ball extends Sprite
{
    
    public function Ball()
    {
        this.alpha = 0.75;
        this.useHandCursor = true;
        this.buttonMode = true;
        this.draw();
    }

    protected var color:uint;
    protected var radius:Number = 10;
    
    public function poke ():void
    {
        this.radius++;
        this.color = Math.random() * uint.MAX_VALUE;
        this.draw();
    }
    
    protected function draw ():void
    {
        this.graphics.clear();
        this.graphics.beginFill(this.color);
        this.graphics.drawCircle(0, 0, this.radius);
    }
}
}
