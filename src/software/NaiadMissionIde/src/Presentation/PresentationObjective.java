package Presentation;

import Drawables.LanguageObjectDrawable;
import Drawables.LanguageVariableDrawable;
import Drawables.MarkerObjectDrawable;
import Drawables.TransactionObjectDrawable;
import Exceptions.UnableToPreformActionException;
import Factories.DrawableLanguageVariableObjectFactory;
import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import LanguageHandlers.EndMarker;
import LanguageHandlers.LanguageVariable;
import LanguageHandlers.StartMarker;

import java.awt.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Observable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/2/13
 * Time: 8:10 AM
 * To change this template use File | Settings | File Templates.
 */
public class PresentationObjective extends Observable
{

    private IDrawable startMarker;
    private IDrawable endMarker;
    private List<IDrawable> ILanguageObjectPresentationObjects;
    private List<IDrawable> ILanguageObjectTransitions;
    private List<IDrawable> ILanguageVariablePresentationObjects;

    public PresentationObjective()
    {
        this.startMarker = new MarkerObjectDrawable(new StartMarker(), new Point(100,100), 50);
        this.endMarker =  new MarkerObjectDrawable(new EndMarker(), new Point(500,500), 50);

        this.ILanguageObjectTransitions = new ArrayList<IDrawable>();
        this.ILanguageObjectPresentationObjects = new ArrayList<IDrawable>();
        this.ILanguageVariablePresentationObjects = new ArrayList<IDrawable>();
    }

    public Graphics Draw(Graphics g)
    {
        this.startMarker.Draw(g);
        this.endMarker.Draw(g);

         for(int i = 0; i < ILanguageObjectPresentationObjects.size(); i++)
         {
             this.ILanguageObjectPresentationObjects.get(i).Draw(g);
         }

        for(int i = 0; i < ILanguageObjectTransitions.size(); i++)
        {
            this.ILanguageObjectTransitions.get(i).Draw(g);
        }

        for(int i = 0; i < ILanguageVariablePresentationObjects.size(); i++)
        {
            this.ILanguageVariablePresentationObjects.get(i).Draw(g);
        }

        return g;
    }

    public void addItem(ILanguageObject object, Point position) throws UnableToPreformActionException {
       this.ILanguageObjectPresentationObjects.add(new LanguageObjectDrawable(object, position));
        this.setChanged();
        this.notifyObservers();
    }

    public void addTransition(IDrawable predecessor, IDrawable successor)
    {
        this.ILanguageObjectTransitions.add(new TransactionObjectDrawable(predecessor, successor));
        this.setChanged();
        this.notifyObservers();
    }

    public Object[] getScope() {
        return new Object[]{ this.ILanguageObjectPresentationObjects, this.ILanguageObjectTransitions};
    }

    public List<IDrawable> getTransitions() {
        return this.ILanguageObjectTransitions;
    }

    public void removeTransition(IDrawable transitionToRemove) {
        this.ILanguageObjectTransitions.remove(transitionToRemove);
        this.setChanged();
        this.notifyObservers();
    }

    public void addVariable(ILanguageVariable object, Point position) {

        LanguageVariableDrawable obj = DrawableLanguageVariableObjectFactory.getObject(object.getName());
        obj.setPosition(position);

        this.ILanguageVariablePresentationObjects.add(obj);
        this.setChanged();
        this.notifyObservers();
    }
}
