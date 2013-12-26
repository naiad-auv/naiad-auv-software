package Commands.DrawingAreaEventHandlingCommands;

import Drawables.LanguageObjectDrawable;
import Drawables.LanguageVariableDrawable;
import Drawables.TransactionObjectDrawable;
import Exceptions.NullReferenceException;
import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.IDrawConfig;
import Interfaces.ILanguageObject;
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

    private IDrawConfig predecessor;
    private PresentationObjective scope;
    private MouseEvent eventArgs;

    @Override
    public Object execute() throws NotImplementedException
    {
        IDrawConfig objectUnderCursor = this.findObjectUnderCursor();
        if(objectUnderCursor == null && this.predecessor == null)
            return null;

        if(this.predecessor != null && objectUnderCursor == null)
        {
            this.predecessor.setPosition(this.eventArgs.getPoint());
            this.prepareForNewEvent();
            return true;
        }

        if(this.predecessor == null && objectUnderCursor != null)
        {
            return true;
        }

        if(this.tryCreateVariableAssignment(this.predecessor, objectUnderCursor))
        {
            this.prepareForNewEvent();
            return true;
        }

        if(this.tryCreateTransition(this.predecessor, objectUnderCursor))
        {

            this.prepareForNewEvent();
            return true;
        }

        this.prepareForNewEvent();

        return null;
    }

    private boolean tryCreateVariableAssignment(IDrawConfig predecessor, IDrawConfig successor) {
        if(!(predecessor.getClass().equals(LanguageVariableDrawable.class) &&
                successor.getClass().equals(LanguageObjectDrawable.class)))
            return false;

        int width = successor.getWidth();
        int size = width / (((ILanguageObject) successor.getScope()).getInputVariables().size() + 1);

        int pos = (this.eventArgs.getX() - successor.getPosition().x - size) / size;

        IDrawConfig assignedTo = ((ILanguageObject) successor.getScope()).getInputVariables().get(pos);

        this.scope.addVariableAssignment(predecessor, assignedTo);

        return true;
    }

    private boolean tryCreateTransition(IDrawConfig predecessor, IDrawConfig successor) {

        if(!(predecessor.getClass().equals(LanguageObjectDrawable.class) &&
                successor.getClass().equals(LanguageObjectDrawable.class)))
            return false;

        List<IDrawConfig> currentTransitions = this.scope.getTransitions();

        IDrawConfig transitionWithPredecessor = null;
        IDrawConfig transitionWithSuccessor = null;

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

        return true;
    }

    private void prepareForNewEvent() {
        this.predecessor = null;
    }

    private IDrawConfig findObjectUnderCursor()
    {
        Point mousePosition = this.eventArgs.getPoint();

        return this.scope.getObjectUnderCursor(mousePosition);
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported
    {

        if(scopeObjects.size() == 1)
        {
            this.predecessor = (IDrawConfig) scopeObjects.get(0);
            return;
        }

        if(scopeObjects.size() == 2)
        {
            this.scope = (PresentationObjective) scopeObjects.get(0);
            this.eventArgs = (MouseEvent) scopeObjects.get(1);
            return;
        }

        throw new ScopeModificationNotSupported("Nr of arguments not applicable");
    }
}
