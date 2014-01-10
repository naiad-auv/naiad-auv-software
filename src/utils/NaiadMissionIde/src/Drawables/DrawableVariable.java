package Drawables;

import Enums.VariableType;
import Factories.IDrawableFactory;
import Interfaces.IDrawConfig;

import java.awt.*;
import java.awt.geom.Line2D;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/9/13
 * Time: 1:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class DrawableVariable implements IDrawConfig {

    private VariableType typeNeeded;

    private IDrawConfig variableAssigned;
    private Point position;

    public DrawableVariable(VariableType type, Point position)
    {
        this.typeNeeded = type;
        this.position = position;
    }

    public DrawableVariable(DrawableVariable other)
    {
        this.typeNeeded = other.typeNeeded;
        this.position = new Point(other.position);

        this.variableAssigned = IDrawableFactory.getCopy(other.variableAssigned);
    }

  /*  @Override
    public void Draw(Graphics g)
    {
        Stroke baseStroke = ((Graphics2D)g).getStroke();

        ((Graphics2D)g).setStroke(new BasicStroke(2.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL));
        ((Graphics2D)g).draw(new Line2D.Double(this.position.x, this.position.y - 10, this.position.x, this.position.y + 10));
        g.drawString(this.typeNeeded.toString().substring(0, 1), this.position.x + 5, this.position.y);

        if(variableAssigned == null)
        {
            ((Graphics2D) g).setStroke(baseStroke);
            return;
        }

        Point startPoint = this.position;
        Point endPoint = this.getVariableCenter();

        ((Graphics2D)g).draw(new Line2D.Double(startPoint.x, startPoint.y, endPoint.x, endPoint.y));

        ((Graphics2D) g).setStroke(baseStroke);
    }  */

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
        return this.position;  //To change body of implemented methods use File | Settings | File Templates.
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
        this.variableAssigned = (IDrawConfig)variable;
    }

    @Override
    public Color getColor() {
        return null;
    }
}
