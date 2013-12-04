package Presentation;

import Exceptions.NullReferenceException;
import Exceptions.UnableToPreformActionException;
import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;

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
    private List<ILanguageObjectPresentationObject> ILanguageObjectPresentationObjects;
    private List<ILanguageObjectTransitionPresentationObject> ILangueageObjectTransitions;

    private Objective objective;

    int posX;
    int posY;

    public PresentationObjective(int x,int y, Objective objective)
    {
        this.posX = x;
        this.posY = y;

        this.objective = objective;

        try
        {
            this.populatePrimitivePresentationObjects();
        }
        catch (NullReferenceException e) {
            System.out.println("NullReferenceException thrown");
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        this.ILangueageObjectTransitions = new ArrayList<ILanguageObjectTransitionPresentationObject>();
    }

    private void populatePrimitivePresentationObjects() throws NullReferenceException {
        List<ILanguageObject> executionalSteps  = this.objective.getExecutionalSteps();

        this.ILanguageObjectPresentationObjects = new ArrayList<ILanguageObjectPresentationObject>();
        for(int i = 0; i < executionalSteps.size(); i++)
        {
            this.ILanguageObjectPresentationObjects.add(new ILanguageObjectPresentationObject(executionalSteps.get(i)));
        }
    }

    public Graphics Draw(Graphics g)
    {
         for(int i = 0; i < ILanguageObjectPresentationObjects.size(); i++)
         {
             this.ILanguageObjectPresentationObjects.get(i).Draw(g);
         }

        for(int i = 0; i < ILangueageObjectTransitions.size(); i++)
        {
            this.ILangueageObjectTransitions.get(i).Draw(g);
        }

        return g;
    }

    public void addItem(ILanguageObject object, int x, int y) throws UnableToPreformActionException {
        this.objective.AddExecutionalStep(object);
        this.ILanguageObjectPresentationObjects.add(new ILanguageObjectPresentationObject(object,x,y));
        this.setChanged();
        this.notifyObservers();
    }

    public void addTransition(ILanguageObjectPresentationObject predecessor, ILanguageObjectPresentationObject successor)
    {
        //TODO ta bort text
        System.out.println("Adding transition");

        this.ILangueageObjectTransitions.add(new ILanguageObjectTransitionPresentationObject(predecessor,successor));
        this.setChanged();
        this.notifyObservers();
    }

    public Object getScope() {
        return new Object[]{ this.objective, this.ILanguageObjectPresentationObjects, this.ILangueageObjectTransitions };
    }
}
