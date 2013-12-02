package Presentation;

import Exceptions.NullReferenceException;
import Exceptions.UnableToPreformActionException;
import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

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
             ILanguageObjectPresentationObject objectToDraw = this.ILanguageObjectPresentationObjects.get(i);

             DrawPresentationObject(objectToDraw,g);
         }

        return g;
    }

    private void DrawPresentationObject(ILanguageObjectPresentationObject object, Graphics g)
    {
        Graphics canvas =  g.create(object.x, object.y, object.width, object.height);

        canvas.drawRect(0,0,object.width - 1, object.height - 1);
        canvas.drawString(object.toString(), 0, object.height/2);

    }

    public void addItem(ILanguageObject object, int x, int y) throws UnableToPreformActionException {
        this.objective.AddExecutionalStep(object);
        this.ILanguageObjectPresentationObjects.add(new ILanguageObjectPresentationObject(object,x,y));
        this.setChanged();
        this.notifyObservers();
    }

    public Object getScope() {
        return this.objective;
    }
}
