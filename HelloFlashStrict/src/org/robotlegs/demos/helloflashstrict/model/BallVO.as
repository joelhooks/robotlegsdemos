/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.model
{

import flash.display.DisplayObject;


public class BallVO implements IBallVO
{

    public function BallVO (displayer:DisplayObject)
    {
        this._displayer = displayer;
    }

    private var _displayer:DisplayObject;
    
    public function get displayer ():DisplayObject
    {
        return this._displayer;
    }

}
}
