/**
 * @author Cotton Hou
 */
package org.robotlegs.demos.helloflashstrict.controller
{

import org.robotlegs.demos.helloflashstrict.model.BallVO;
import org.robotlegs.demos.helloflashstrict.model.IBallContainer;
import org.robotlegs.demos.helloflashstrict.model.IBallVO;
import org.robotlegs.demos.helloflashstrict.view.Ball;
import org.robotlegs.mvcs.Command;


public class CreateBallCommand extends Command
{

    [Inject]
    public var container:IBallContainer;
    
    override public function execute ():void
    {
        var ball:Ball = new Ball();
            ball.x = Math.random() * 500;
            ball.y = Math.random() * 375;
            
        var vo:IBallVO = new BallVO(ball);
        
        this.container.add(vo);
    }

}
}
