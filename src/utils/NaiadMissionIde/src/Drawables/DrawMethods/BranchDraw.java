package Drawables.DrawMethods;

import Abstracts.ADrawingConfiguration;
import Interfaces.IDraw;
import Interfaces.IDrawConfig;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class BranchDraw implements IDraw
{
    public BranchDraw()
    {

    }

    @Override
    public void Draw(Graphics g, ADrawingConfiguration configuration) {
        g.setColor(configuration.getColor());
        g.fillPolygon(new int[]{configuration.getPosition().x,
                                configuration.getPosition().x - configuration.getWidth() / 2,
                                configuration.getPosition().x,
                                configuration.getPosition().x + configuration.getWidth() / 2},
                      new int[]{configuration.getPosition().y + configuration.getHeight() / 2,
                                configuration.getPosition().y,
                                configuration.getPosition().y - configuration.getHeight() / 2,
                                configuration.getPosition().y}, 4);

        g.setColor(Color.black);
        g.drawPolygon(new int[]{configuration.getPosition().x,
                                configuration.getPosition().x - configuration.getWidth() / 2,
                                configuration.getPosition().x,
                                configuration.getPosition().x + configuration.getWidth() / 2},
                      new int[]{configuration.getPosition().y + configuration.getHeight() / 2,
                                configuration.getPosition().y,
                                configuration.getPosition().y - configuration.getHeight() / 2,
                                configuration.getPosition().y}, 4);
    }
}
