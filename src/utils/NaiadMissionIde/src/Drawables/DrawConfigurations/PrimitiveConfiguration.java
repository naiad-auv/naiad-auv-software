package Drawables.DrawConfigurations;

import Abstracts.ADrawingConfiguration;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:48 AM
 * To change this template use File | Settings | File Templates.
 */
public class PrimitiveConfiguration extends ADrawingConfiguration
{
    public PrimitiveConfiguration(Point position)
    {
        super(position, 50, 50, new Color(100,100,100));
    }
}
