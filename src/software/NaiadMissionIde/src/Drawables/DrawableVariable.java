package Drawables;

import Enums.VariableType;
import Interfaces.IDrawable;

import java.awt.*;
import java.awt.geom.Line2D;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/9/13
 * Time: 1:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class DrawableVariable implements IDrawable {

    private VariableType typeNeeded;

    private IDrawable variableAssigned;
    private Point position;

    public DrawableVariable(VariableType type, Point position)
    {
        this.typeNeeded = type;
        this.position = position;
    }

    @Override
    public void Draw(Graphics g)
    {
        if(variableAssigned == null)
            return;

        Point startPoint = this.position;
        Point endPoint = this.getVariableCenter();

        ((Graphics2D)g).setStroke(new BasicStroke(2.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL)); // g2 is an instance of Graphics2D
        ((Graphics2D)g).draw(new Line2D.Double(startPoint.x, startPoint.y, endPoint.x, endPoint.y));
    }

    private Point getVariableCenter() {

        Point upperLeft = new Point(this.variableAssigned.getPosition());
        upperLeft.x += this.variableAssigned.getWidth() / 2;
        upperLeft.y += this.variableAssigned.getHeight() / 2;

        return upperLeft;
    }

    @Override
    public String toString()
    {
        return this.typeNeeded.toString().substring(0,1);
    }

    @Override
    public void calculateDrawingSize() {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Point getPosition() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getWidth() {
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getHeight() {
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setPosition(Point p) {
        this.position = p;
    }

    @Override
    public boolean isPointInside(Point p) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getScope() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setScope(Object variable) {
        this.variableAssigned = (IDrawable)variable;
    }
}
