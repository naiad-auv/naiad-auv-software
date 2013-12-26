package Drawables;

import Interfaces.IDrawConfig;
import Interfaces.ILanguageObject;

import java.awt.*;
import java.util.Observable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/11/13
 * Time: 12:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class DrawableBranch extends Observable implements IDrawConfig {

    private ILanguageObject baseObject;

    private TransactionObjectDrawable trueTransaction;
    private TransactionObjectDrawable falseTransaction;

    private Point position;
    private int radius = 50;
    private Color color = new Color(100,100,100);

    public DrawableBranch(ILanguageObject object, Point position) {
        this.baseObject = object;
        this.position = position;

        this.trueTransaction = new TransactionObjectDrawable(this);
        this.falseTransaction = new TransactionObjectDrawable(this);
    }

  /*  @Override
    public void Draw(Graphics g) {

        if(this.trueTransaction != null)
            this.trueTransaction.Draw(g);

        if(this.falseTransaction != null)
            this.falseTransaction.Draw(g);

        g.setColor(color);
        g.fillPolygon(new int[]{this.position.x, this.position.x - radius / 2, this.position.x,  this.position.x + radius / 2}, new int[]{this.position.y + radius / 2,this.position.y, this.position.y - radius / 2,  this.position.y}, 4);
        g.setColor(Color.black);
        g.drawPolygon(new int[]{this.position.x, this.position.x - radius / 2, this.position.x, this.position.x + radius / 2}, new int[]{this.position.y + radius / 2,this.position.y, this.position.y - radius / 2,  this.position.y}, 4);

    } */

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
        return this.radius;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public int getHeight() {
        return this.radius;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setPosition(Point p) {
        this.position = new Point(p);

        if(this.trueTransaction != null)
            this.trueTransaction.setPredecessorPosition(p);

        if(this.falseTransaction != null)
            this.falseTransaction.setPredecessorPosition(p);
    }

    @Override
    public boolean isPointInside(Point p) {
        return (p.x > this.position.x - this.getWidth() / 2 && p.x < this.position.x + this.getWidth() / 2 &&
                p.y > this.position.y - this.getHeight() / 2 && p.y < this.position.y + this.getHeight() / 2);
    }

    @Override
    public Object getScope() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setScope(Object variable) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Color getColor() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
