package Commands.DrawingAreaEventHandlingCommands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
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
public class DrawingAreaMousePressedCommand implements ICommand {

    private PresentationObjective scope;
    private MouseEvent eventArgs;

    @Override
    public Object execute() throws NotImplementedException
    {
        return this.findObjectUnderCursor();
    }

    private Object findObjectUnderCursor()
    {
        Point mousePosition = this.eventArgs.getPoint();

        return this.scope.getObjectUnderCursor(mousePosition);
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported
    {

        if(scopeObjects.size() < 2)
        {
            throw new ScopeModificationNotSupported("Not enough arguments");
        }

        this.scope = (PresentationObjective) scopeObjects.get(0);
        this.eventArgs = (MouseEvent) scopeObjects.get(1);
    }
}
