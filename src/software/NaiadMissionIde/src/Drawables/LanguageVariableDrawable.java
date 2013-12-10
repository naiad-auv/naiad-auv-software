package Drawables;

import Interfaces.IDrawable;
import Interfaces.ILanguageVariable;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.util.Observable;
import java.util.Observer;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/6/13
 * Time: 8:01 AM
 * To change this template use File | Settings | File Templates.
 */
public class LanguageVariableDrawable extends Observable implements IDrawable, Observer {

    private ILanguageVariable variableToDraw;
    private Color drawingColor;

    private Point position;
    private int radius;

    public LanguageVariableDrawable(ILanguageVariable variableToDraw)
    {
        this.variableToDraw = variableToDraw;
        this.variableToDraw.addObserver(this);
    }

    public void Initialize()
    {
        this.position = new Point(0,0);
        this.calculateDrawingSize();
    }

    @Override
    public void Draw(Graphics g) {

        g.setColor(this.drawingColor);
        g.fillOval(this.position.x, this.position.y, this.getWidth(), this.getHeight());
        g.setColor(Color.black);
        g.drawOval(this.position.x, this.position.y, this.getWidth(), this.getHeight());
        g.setFont(new Font(Font.SERIF, Font.PLAIN, PenumbraCoreSettings.getInstance().FontSize));
        g.drawString(variableToDraw.toString(),this.position.x  + 10, this.position.y + this.getHeight() / 2 + 6);

    }

    private int calculateNameWidth()
    {
        FontRenderContext frc = new FontRenderContext( new AffineTransform(),true,true);
        Font font = new Font(Font.SERIF, Font.PLAIN, PenumbraCoreSettings.getInstance().FontSize);

        return (int)(font.getStringBounds(this.variableToDraw.toString(), frc).getWidth());
    }

    @Override
    public void calculateDrawingSize() {

        //TODO räkna ut radius baserat på variabel namnet
        this.radius = this.calculateNameWidth() + PenumbraCoreSettings.getInstance().FontSize * 2;

    }

    @Override
    public Point getPosition() {
        return this.position;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getWidth() {
        return radius;
    }

    @Override
    public int getHeight() {
        return Math.min(radius/2,50);  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setPosition(Point p) {
        this.position = p;
        this.setChanged();
        this.notifyObservers();
    }

    @Override
    public boolean isPointInside(Point mousePosition) {
        return (mousePosition.x > this.position.x && mousePosition.x < this.position.x + this.radius &&
                mousePosition.y > this.position.y && mousePosition.y < this.position.y + this.radius/2);
    }

    @Override
    public Object getScope() {
        return this.variableToDraw;
    }

    @Override
    public void setScope(Object variable) {
        this.variableToDraw = (ILanguageVariable)variable;
    }

    public void setColor(Color color)
    {
       this.drawingColor = color;
    }

    @Override
    public void update(Observable observable, Object o) {
        this.calculateDrawingSize();

        this.setChanged();
        this.notifyObservers();
    }
}