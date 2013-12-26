package Interfaces;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 3:49 PM
 * To change this template use File | Settings | File Templates.
 */
public interface IDrawConfig {

    public void calculateDrawingSize();

    public Point getPosition();
    public int getWidth();
    public int getHeight();

    public void setPosition(Point p);

    public boolean isPointInside(Point p);


    public Object getScope();

    public void setScope(Object variable);

    public Color getColor();
}
