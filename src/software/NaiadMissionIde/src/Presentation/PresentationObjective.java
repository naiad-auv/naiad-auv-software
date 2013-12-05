package Presentation;

import Exceptions.NullReferenceException;
import Exceptions.UnableToPreformActionException;
import Interfaces.ILanguageObject;
import LanguageHandlers.EndMarker;
import LanguageHandlers.Objective;
import LanguageHandlers.StartMarker;

import java.awt.*;
import java.util.ArrayList;
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

    private StartMarker startMarker;
    private EndMarker endMarker;
    private List<ILanguageObjectPresentationObject> ILanguageObjectPresentationObjects;
    private List<ILanguageObjectTransitionPresentationObject> ILangueageObjectTransitions;

    public PresentationObjective()
    {
        this.startMarker = new StartMarker();
        this.endMarker = new EndMarker();

        this.ILangueageObjectTransitions = new ArrayList<ILanguageObjectTransitionPresentationObject>();
        this.ILanguageObjectPresentationObjects = new ArrayList<ILanguageObjectPresentationObject>();
    }

    public Graphics Draw(Graphics g)
    {
        this.startMarker.Draw(g);
        this.endMarker.Draw(g);

         for(int i = 0; i < ILanguageObjectPresentationObjects.size(); i++)
         {
             this.ILanguageObjectPresentationObjects.get(i).Draw(g);
         }

        for(int i = 0; i < ILangueageObjectTransitions.size(); i++)
        {
            this.ILangueageObjectTransitions.get(i).Draw((Graphics2D)g);
        }

        return g;
    }

    public void addItem(ILanguageObject object, int x, int y) throws UnableToPreformActionException {
       this.ILanguageObjectPresentationObjects.add(new ILanguageObjectPresentationObject(object,x,y));
        this.setChanged();
        this.notifyObservers();
    }

    public void addTransition(ILanguageObjectPresentationObject predecessor, ILanguageObjectPresentationObject successor)
    {
        this.ILangueageObjectTransitions.add(new ILanguageObjectTransitionPresentationObject(predecessor,successor));
        this.setChanged();
        this.notifyObservers();
    }

    public Object[] getScope() {
        return new Object[]{ this.ILanguageObjectPresentationObjects, this.ILangueageObjectTransitions };
    }

    public List<ILanguageObjectTransitionPresentationObject> getTransitions() {
        return this.ILangueageObjectTransitions;
    }

    public void removeTransition(ILanguageObjectTransitionPresentationObject transitionToRemove) {
        this.ILangueageObjectTransitions.remove(transitionToRemove);
        this.setChanged();
        this.notifyObservers();
    }
}
