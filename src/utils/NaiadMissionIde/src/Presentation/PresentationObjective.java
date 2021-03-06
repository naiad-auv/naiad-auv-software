package Presentation;

import Drawables.*;
import Exceptions.UnableToPreformActionException;
import Factories.DrawableLanguageVariableObjectFactory;
import Interfaces.IDrawConfig;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;

import java.awt.*;
import java.util.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/2/13
 * Time: 8:10 AM
 * To change this template use File | Settings | File Templates.
 */
public class PresentationObjective extends Observable implements Observer
{

    private IDrawConfig startMarker;
    private IDrawConfig endMarker;
    private List<IDrawConfig> ILanguageObjectPresentationObjects;
    private List<IDrawConfig> ILanguageObjectTransitions;
    private List<IDrawConfig> ILanguageVariablePresentationObjects;
    private List<IDrawConfig> IVariableAssignmentsObjects;

    public PresentationObjective()
    {
      //  this.startMarker = new MarkerObjectDrawable(new StartMarker(), new Point(100,100), 50);
      //  this.endMarker =  new MarkerObjectDrawable(new EndMarker(), new Point(500,500), 50);

        this.ILanguageObjectTransitions = new ArrayList<IDrawConfig>();
        this.ILanguageObjectPresentationObjects = new ArrayList<IDrawConfig>();
        this.ILanguageVariablePresentationObjects = new ArrayList<IDrawConfig>();
        this.IVariableAssignmentsObjects = new ArrayList<IDrawConfig>();
    }

    public Graphics Draw(Graphics g)
    {
        for(int i = 0; i < ILanguageObjectTransitions.size(); i++)
        {
      //      this.ILanguageObjectTransitions.get(i).Draw(g);
        }

        for(int i = 0; i < IVariableAssignmentsObjects.size(); i++)
        {
    //        this.IVariableAssignmentsObjects.get(i).Draw(g);
        }

         for(int i = 0; i < ILanguageObjectPresentationObjects.size(); i++)
         {
    //         this.ILanguageObjectPresentationObjects.get(i).Draw(g);
         }


        for(int i = 0; i < ILanguageVariablePresentationObjects.size(); i++)
        {
    //        this.ILanguageVariablePresentationObjects.get(i).Draw(g);
        }

        return g;
    }

    public void addItem(ILanguageObject object, Point position) throws UnableToPreformActionException {


        IDrawConfig objectToDraw = null;

        switch(object.getType())
        {
            case Primitive:
            case Objective:
                objectToDraw = new LanguageObjectDrawable(object, position);
                ((LanguageObjectDrawable)objectToDraw).addObserver(this);
                break;
            case Branch:
                objectToDraw = new DrawableBranch(object, position);
                ((DrawableBranch)objectToDraw).addObserver(this);
                break;
        }

        if(objectToDraw == null)
            return;

       this.ILanguageObjectPresentationObjects.add(objectToDraw);

       this.setChanged();
       this.notifyObservers();
    }

    public void addTransition(IDrawConfig predecessor, IDrawConfig successor)
    {
        this.ILanguageObjectTransitions.add(new TransactionObjectDrawable(predecessor, successor));
        this.setChanged();
        this.notifyObservers();
    }

    public Object[] getScope() {
        return new Object[]{ this.ILanguageObjectPresentationObjects, this.ILanguageObjectTransitions};
    }

    public List<IDrawConfig> getTransitions() {
        return this.ILanguageObjectTransitions;
    }

    public void removeTransition(IDrawConfig transitionToRemove) {
        this.ILanguageObjectTransitions.remove(transitionToRemove);
        this.setChanged();
        this.notifyObservers();
    }

    public void addVariable(ILanguageVariable object, Point position)
    {
        LanguageVariableDrawable obj = DrawableLanguageVariableObjectFactory.getObject(object.getName());
        obj.setPosition(position);
        obj.addObserver(this);

        this.ILanguageVariablePresentationObjects.add(obj);
        this.setChanged();
        this.notifyObservers();
    }

    public void addVariableAssignment(IDrawConfig variable, IDrawConfig assignedTo)
    {
        assignedTo.setScope(variable);
        this.setChanged();
        this.notifyObservers();
    }

    public IDrawConfig getObjectUnderCursor(Point point) {
        for(int i = 0; i < this.ILanguageVariablePresentationObjects.size(); i++)
        {
            if(this.ILanguageVariablePresentationObjects.get(i).isPointInside(point))
                return this.ILanguageVariablePresentationObjects.get(i);
        }

        for(int i = 0; i < this.ILanguageObjectPresentationObjects.size(); i++)
        {
            if(this.ILanguageObjectPresentationObjects.get(i).isPointInside(point))
                return this.ILanguageObjectPresentationObjects.get(i);
        }

        /*if(this.startMarker.isPointInside(point))
            return this.startMarker;

        if(this.endMarker.isPointInside(point))
            return this.endMarker;  */

        return null;
    }

    @Override
    public void update(Observable observable, Object o) {
        this.setChanged();
        this.notifyObservers();
    }

    public void moveObjects(int deltaX, int deltaY) {

        for(IDrawConfig drawable : this.ILanguageObjectTransitions)
        {
            if(drawable != null)
            {
                Point currentPosition = drawable.getPosition();

                if(currentPosition != null)
                {
                    drawable.setPosition(new Point(drawable.getPosition().x + deltaX, drawable.getPosition().y + deltaY));
                }
            }
        }

        for(IDrawConfig drawable : this.ILanguageObjectPresentationObjects)
        {
            if(drawable != null)
            {
                Point currentPosition = drawable.getPosition();

                if(currentPosition != null)
                {
                    drawable.setPosition(new Point(drawable.getPosition().x + deltaX, drawable.getPosition().y + deltaY));
                }
            }
        }

        for(IDrawConfig drawable : this.ILanguageVariablePresentationObjects)
        {
            if(drawable != null)
            {
                Point currentPosition = drawable.getPosition();

                if(currentPosition != null)
                {
                    drawable.setPosition(new Point(drawable.getPosition().x + deltaX, drawable.getPosition().y + deltaY));
                }
            }
        }

        for(IDrawConfig drawable : this.IVariableAssignmentsObjects)
        {
            if(drawable != null)
            {
                Point currentPosition = drawable.getPosition();

                if(currentPosition != null)
                {
                    drawable.setPosition(new Point(drawable.getPosition().x + deltaX, drawable.getPosition().y + deltaY));
                }
            }
        }
    }
}
