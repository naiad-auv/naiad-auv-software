package Drawables;

import Exceptions.NullReferenceException;
import Interfaces.IDrawable;
import java.awt.*;
import java.awt.geom.Ellipse2D;
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

    public TransactionObjectDrawable(TransactionObjectDrawable other) {
        this.predecessor = other.predecessor;
        this.successor = other.successor;
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

        Stroke baseStroke = ((Graphics2D)g).getStroke();

        Point startPoint = this.getPredecessorPosition();
        Point endPoint = this.getSuccessorPosition();


        ((Graphics2D)g).setStroke(new BasicStroke(2.0f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL)); // g2 is an instance of Graphics2D
        ((Graphics2D)g).draw(new Line2D.Double(startPoint.x, startPoint.y, endPoint.x, endPoint.y));

      /*  double k = 0.0;
        if(endPoint.x - startPoint.x != 0.0)
        {
            float deltaX = endPoint.x - startPoint.x;
            float deltaY = endPoint.y - startPoint.y;

            k = deltaY / deltaX;
        }

        Point predecessorIdentifierPoint = new Point(startPoint);
        Point successorIdentifierPoint = new Point(endPoint);

        successorIdentifierPoint.x *= 0.9;
        successorIdentifierPoint.y *=0.9;

        if(startPoint.x < endPoint.x)
        {
            //predecessor is before successor

            predecessorIdentifierPoint.x += this.predecessor.getWidth()/2;
            predecessorIdentifierPoint.y += (this.predecessor.getWidth()/2) * k;

            successorIdentifierPoint.x -= this.successor.getWidth()/2;
            successorIdentifierPoint.y += (this.successor.getWidth()/2) * k;


        }
        else
        {
            //successor before predecessor
            predecessorIdentifierPoint.x -= this.predecessor.getWidth()/2;
            predecessorIdentifierPoint.y += (this.predecessor.getWidth()/2) * k;

            successorIdentifierPoint.x += this.successor.getWidth()/2;
            successorIdentifierPoint.y += (this.successor.getWidth()/2) * k;

        }

        Ellipse2D.Double predecessorIdentifier = new Ellipse2D.Double(successorIdentifierPoint.x, successorIdentifierPoint.y, 10,10);
        ((Graphics2D) g).fill(predecessorIdentifier);                                           */


        ((Graphics2D) g).setStroke(baseStroke);
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

    @Override
    public Object getScope() {
        //TODO ska detta returnera scope eller inte
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setScope(Object variable) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    public Point getPredecessorPosition() {

        Point predecessorPosition = (Point) this.predecessor.getPosition().clone();

        predecessorPosition.x += this.predecessor.getWidth() / 2;
        predecessorPosition.y += this.predecessor.getHeight() / 2;

        return predecessorPosition;
    }

    public Point getSuccessorPosition() {

        Point successorPosition = (Point) this.successor.getPosition().clone();

        successorPosition.x += this.successor.getWidth() / 2;
        successorPosition.y += this.successor.getHeight() / 2;

        return successorPosition;
    }

    public void setPredecessorPosition(Point predecessorPosition) {
        this.predecessor.setPosition(predecessorPosition);
    }
}
