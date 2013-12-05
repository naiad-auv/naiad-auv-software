package ViewModels;

import Commands.DrawingAreaEventHandlingCommands.DrawingAreaClickedCommand;
import Commands.DrawingAreaEventHandlingCommands.DrawingAreaMousePressedCommand;
import Commands.DrawingAreaEventHandlingCommands.DrawingAreaMouseReleasedCommand;
import Exceptions.ScopeModificationNotSupported;
import Exceptions.UnableToPreformActionException;
import Interfaces.ICommand;
import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Interfaces.IViewModel;
import LanguageHandlers.Objective;
import Presentation.PresentationObjective;
import UserControls.EJDrawingArea;

import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/29/13
 * Time: 10:25 AM
 * To change this template use File | Settings | File Templates.
 */
public class DrawingAreaViewModel extends Observable implements IViewModel, Observer {

    private PresentationObjective presentationObjective;

    private Objective objectiveScope;

    private ICommand onMouseClickedCommand;
    private ICommand onMousePressedCommand;
    private ICommand onMouseReleasedCommand;

    public DrawingAreaViewModel(Objective objective)
    {
        this.objectiveScope = objective;
        this.presentationObjective = new PresentationObjective();
        this.presentationObjective.addObserver(this);

        this.onMouseClickedCommand = new DrawingAreaClickedCommand();
        this.onMousePressedCommand = new DrawingAreaMousePressedCommand();
        this.onMouseReleasedCommand = new DrawingAreaMouseReleasedCommand();
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

        view.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(final MouseEvent eventArgs) {

              /*  try
                {
                    onMouseClickedCommand.setScope(new ArrayList<Object>(){{ add(presentationObjective); add(eventArgs);}});
                }
                catch (ScopeModificationNotSupported scopeModificationNotSupported) {
                    scopeModificationNotSupported.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
                onMouseClickedCommand.execute(); */

            }

            @Override
            public void mousePressed(final MouseEvent eventArgs) {

                try {
                    onMousePressedCommand.setScope(new ArrayList<Object>() {{ add(presentationObjective); add(eventArgs); }});
                    final IDrawable selectedObject = (IDrawable)onMousePressedCommand.execute();

                    if(selectedObject == null)
                        return;


                    onMouseReleasedCommand.setScope(new ArrayList<Object>() {{
                        add(selectedObject);
                    }});
                } catch (ScopeModificationNotSupported scopeModificationNotSupported) {
                    scopeModificationNotSupported.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                }
            }

            @Override
            public void mouseReleased(final MouseEvent eventArgs)
            {  try {
                onMouseReleasedCommand.setScope(new ArrayList<Object>() {{
                    add(presentationObjective); add(eventArgs);
                }});
            } catch (ScopeModificationNotSupported scopeModificationNotSupported) {
                scopeModificationNotSupported.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
                onMouseReleasedCommand.execute();
            }
        });

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

    public void addItem(ILanguageObject object, Point position) throws UnableToPreformActionException {
        this.presentationObjective.addItem(object, position);
    }

    public Object getScope() {
        return this.presentationObjective.getScope();
    }
}
