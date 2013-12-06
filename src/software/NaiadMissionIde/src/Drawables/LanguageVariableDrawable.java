package Drawables;

import Interfaces.IDrawable;
import Interfaces.ILanguageVariable;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/6/13
 * Time: 8:01 AM
 * To change this template use File | Settings | File Templates.
 */
public class LanguageVariableDrawable implements IDrawable {

    private ILanguageVariable variableToDraw;
    private Color drawingColor;

    private Point position;
    private int radius;

    public LanguageVariableDrawable(ILanguageVariable variableToDraw)
    {
        this.variableToDraw = variableToDraw;
        this.position = new Point(0,0);

        this.calculateDrawingSize();
    }

    public LanguageVariableDrawable(ILanguageVariable variableToDraw, Point position)
    {
        this.variableToDraw = variableToDraw;
        this.position = position;

        this.calculateDrawingSize();
    }

    @Override
    public void Draw(Graphics g) {

        g.setColor(this.drawingColor);
        g.fillOval(this.position.x, this.position.y, this.radius, this.radius/2);
        g.setColor(Color.black);
        g.drawOval(this.position.x, this.position.y, this.radius, this.radius/2);
        g.drawString(variableToDraw.toString(),this.position.x  + this.radius/2 - 3, 5);

    }

    @Override
    public void calculateDrawingSize() {

        //TODO räkna ut radius baserat på variabel namnet
        this.radius = 100;

    }

    @Override
    public Point getPosition() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getWidth() {
        return radius;
    }

    @Override
    public int getHeight() {
        return radius/2;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setPosition(Point p) {
        this.position = p;
    }

    @Override
    public boolean isPointInside(Point mousePosition) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public void setColor(Color color)
    {
       this.drawingColor = color;
    }
}