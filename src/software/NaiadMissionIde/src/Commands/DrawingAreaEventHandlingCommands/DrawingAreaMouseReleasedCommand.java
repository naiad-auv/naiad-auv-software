package Commands.DrawingAreaEventHandlingCommands;

import Drawables.TransactionObjectDrawable;
import Exceptions.NullReferenceException;
import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.IDrawable;
import Presentation.PresentationObjective;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.awt.*;
import java.awt.event.MouseEvent;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 9:58 AM
 * To change this template use File | Settings | File Templates.
 */
public class DrawingAreaMouseReleasedCommand implements ICommand {

    private IDrawable predecessor;
    private PresentationObjective scope;
    private MouseEvent eventArgs;

    @Override
    public Object execute() throws NotImplementedException
    {
        IDrawable objectUnderCursor = this.findObjetUnderCursor();

        if(objectUnderCursor == null || this.predecessor == null)
            return null;


        this.createTransition(this.predecessor, objectUnderCursor);

        this.prepareForNewEvent();

        return null;
    }

    private void createTransition(IDrawable predecessor, IDrawable successor) {

        List<IDrawable> currentTransitions = this.scope.getTransitions();

        IDrawable transitionWithPredecessor = null;
        IDrawable transitionWithSuccessor = null;

        for(int i = 0; i < currentTransitions.size(); i++)
        {
            try {
                if( ((TransactionObjectDrawable)currentTransitions.get(i)).getPredecessor().equals(predecessor))
                    transitionWithPredecessor = currentTransitions.get(i);

                if(((TransactionObjectDrawable)currentTransitions.get(i)).getSuccessor().equals(successor))
                    transitionWithSuccessor = currentTransitions.get(i);

            } catch (NullReferenceException e) {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }

        if(transitionWithSuccessor != null)
            this.scope.removeTransition(transitionWithSuccessor);

        if(transitionWithPredecessor != null)
            this.scope.removeTransition(transitionWithPredecessor);

        this.scope.addTransition(predecessor,successor);
    }

    private void prepareForNewEvent() {
        this.predecessor = null;
    }

    private IDrawable findObjetUnderCursor()
    {
        Point mousePosition = this.eventArgs.getPoint();

        for(int i = 0; i < ((List<IDrawable>)(this.scope.getScope())[0]).size(); i++)
        {
            IDrawable object = ((List<IDrawable>)(this.scope.getScope()[0])).get(i);

            if(object.isPointInside(mousePosition))
            {
                return object;
            }
        }

        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported
    {

        if(scopeObjects.size() == 1)
        {
            this.predecessor = (IDrawable) scopeObjects.get(0);
            return;
        }

        if(scopeObjects.size() == 2)
        {
            this.scope = (PresentationObjective) scopeObjects.get(0);
            this.eventArgs = (MouseEvent) scopeObjects.get(1);
            return;
        }

        throw new ScopeModificationNotSupported("Nr of arguments not aplicable");
    }
}
