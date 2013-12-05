package Drawables;

import Exceptions.NullReferenceException;
import Interfaces.IDrawable;
import java.awt.*;
import java.awt.geom.Line2D;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/5/13
 * Time: 9:27 AM
 * To change this template use File | Settings | File Templates.
 */
public class TransactionObjectDrawable implements IDrawable {


    private IDrawable predecessor;
    private IDrawable successor;

    public TransactionObjectDrawable(IDrawable predecessor, IDrawable successor)
    {
        this.predecessor = predecessor;
        this.successor = successor;
    }

    public IDrawable getSuccessor() throws NullReferenceException
    {
        if(this.successor == null)
            throw new NullReferenceException("successor not set to an objecgt");
        return this.successor;
    }

    public IDrawable getPredecessor() throws NullReferenceException
    {
        if(this.predecessor == null)
            throw new NullReferenceException("predecessor not set to an object");
        return this.predecessor;
    }

    @Override
    public void Draw(Graphics g) {

        Point startPoint = this.getPredecessorPosition();
        Point endPoint = this.getSuccessorPosition();

        ((Graphics2D)g).setStroke(new BasicStroke(2.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL)); // g2 is an instance of Graphics2D
        ((Graphics2D)g).draw(new Line2D.Double(startPoint.x, startPoint.y, endPoint.x, endPoint.y));
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
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean isPointInside(Point mousePosition) {
        return false;
    }

    public Point getPredecessorPosition() {

        Point predecessorPosition = (Point) this.predecessor.getPosition().clone();

        predecessorPosition.x += this.predecessor.getWidth();
        predecessorPosition.y += this.predecessor.getHeight() / 2;

        return predecessorPosition;
    }

    public Point getSuccessorPosition() {

        Point successorPosition = (Point) this.successor.getPosition().clone();

        successorPosition.y += this.successor.getHeight() / 2;

        return successorPosition;
    }
}
