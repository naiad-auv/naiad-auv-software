package Drawables;

import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.util.Observable;
import java.util.Observer;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 4:06 PM
 * To change this template use File | Settings | File Templates.
 */
public class LanguageObjectDrawable extends Observable implements IDrawable, Observer {

    private ILanguageObject objectToDraw;

    private int width;
    private int height;
    private Point position;

    public LanguageObjectDrawable(ILanguageObject objectToDraw, Point position)
    {
        this.position = position;
        this.objectToDraw = objectToDraw;

        this.objectToDraw.addObserver(this);
        this.calculateDrawingSize();
    }

    @Override
    public void Draw(Graphics g) {
        Graphics canvas =  g.create(this.position.x, this.position.y, this.width, this.height);

        canvas.setColor(new Color(240,95,216));
        canvas.fillRoundRect(0, 10, this.width - 1, this.height - 20, 5, 5);
        canvas.setColor(new Color(148,18,126));
        canvas.drawRoundRect(0, 10, this.width - 1, this.height - 20, 5, 5);

        canvas.setColor(Color.BLACK);


        canvas.setFont(new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize));
        canvas.drawString(this.objectToDraw.toString(), 3, this.height / 2 + 3);

        for(int i = 0; i < this.objectToDraw.getInputVariables().size(); i++)
        {
            this.objectToDraw.getInputVariables().get(i).Draw(g);
            canvas.drawLine((i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1),0,(i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1), 20);
            canvas.drawString(this.objectToDraw.getInputVariables().get(i).toString(),(i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1) + 3, 23);
        }


        for(int i = 0; i < this.objectToDraw.getOutputVariables().size(); i++)
        {
            this.objectToDraw.getOutputVariables().get(i).Draw(g);
            canvas.drawLine((i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1),this.height - 20,(i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1), this.height);
            canvas.drawString(this.objectToDraw.getInputVariables().get(i).toString(),(i + 1) * this.width/(this.objectToDraw.getInputVariables().size() + 1) + 3, this.height - 17);
        }
    }

    public void calculateDrawingSize()
    {
        this.width = calculateDrawingWidth();
        this.height = calculateDrawingHeight();
    }

    private static int calculateDrawingHeight()
    {
        int height = PenumbraCoreSettings.getInstance().FontSize + 60;
        return height;
    }

    private int calculateDrawingWidth()
    {
        int width = 0;

        width = Math.max(width, this.calculateNameWidth() + 9);
        width = Math.max(width, this.objectToDraw.getInputVariables().size() * 30);
        width = Math.max(width, this.objectToDraw.getOutputVariables().size() * 30);

        return width;
    }

    private int calculateNameWidth()
    {
        FontRenderContext frc = new FontRenderContext( new AffineTransform(),true,true);
        Font font = new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize);

        return (int)(font.getStringBounds(this.objectToDraw.toString(), frc).getWidth());
    }

    public Point getPosition()
    {
        return this.position;
    }

    public int getWidth()
    {
        return this.width;
    }

    public int getHeight()
    {
        return this.height;
    }

    public void setPosition(Point newPosition)
    {
        int widthDiff = this.position.x - newPosition.x;
        int heightDiff = this.position.y - newPosition.y;

        for(int i = 0; i < this.objectToDraw.getInputVariables().size(); i++)
        {
            Point p = this.objectToDraw.getInputVariables().get(i).getPosition();

            if(p == null)
                p = new Point(this.getPosition());

            p.x += widthDiff;
            p.y += heightDiff;
        }

        for(int i = 0; i < this.objectToDraw.getOutputVariables().size(); i++)
        {
            Point p = this.objectToDraw.getOutputVariables().get(i).getPosition();

            if(p == null)
                p = new Point(this.getPosition());

            p.x += widthDiff;
            p.y += heightDiff;
        }

        this.position = newPosition;

        this.setChanged();
        this.notifyObservers();
    }

    @Override
    public boolean isPointInside(Point mousePosition)
    {
        return (mousePosition.x > this.position.x && mousePosition.x < this.position.x + this.width &&
                mousePosition.y > this.position.y && mousePosition.y < this.position.y + this.height);
    }

    @Override
    public Object getScope() {
        return this.objectToDraw;
    }

    @Override
    public void setScope(Object variable) {
        this.objectToDraw = (ILanguageObject)variable;
    }

    @Override
    public void update(Observable observable, Object o) {
        this.setChanged();
        this.notifyObservers();
    }
}
