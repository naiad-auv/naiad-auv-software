package ViewModels;

import Exceptions.UnableToPreformActionException;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.IViewModel;
import LanguageHandlers.Objective;
import Presentation.PresentationObjective;
import UserControls.EJDrawingArea;

import java.awt.*;
import java.util.Dictionary;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/29/13
 * Time: 10:25 AM
 * To change this template use File | Settings | File Templates.
 */
public class DrawingAreaViewModel extends Observable implements IViewModel, Observer {

    private PresentationObjective presentationObjective;

    public DrawingAreaViewModel(Objective objective)
    {
        this.presentationObjective = new PresentationObjective(0,0,objective);
        this.presentationObjective.addObserver(this);
    }

    public Graphics Draw(Graphics g)
    {
        this.presentationObjective.Draw(g);
        return g;

    }

    @Override
    public void WireEvents(Object o) throws IllegalArgumentException {
        EJDrawingArea view = (EJDrawingArea)o;

        if(view == null)
            throw new IllegalArgumentException();

    }

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void update(Observable observable, Object o) {
        this.setChanged();
        this.notifyObservers();
    }

    public void addItem(ILanguageObject object, int x, int y) throws UnableToPreformActionException {
        this.presentationObjective.addItem(object,x,y);
    }

    public Object getScope() {
        return this.presentationObjective.getScope();
    }
}
