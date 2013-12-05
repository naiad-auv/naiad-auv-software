package Interfaces;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 3:49 PM
 * To change this template use File | Settings | File Templates.
 */
public interface IDrawable {

    public void Draw(Graphics g);
    public void calculateDrawingSize();

    public Point getPosition();
    public int getWidth();
    public int getHeight();

    public void setPosition(Point p);

    boolean isPointInside(Point mousePosition);
}
