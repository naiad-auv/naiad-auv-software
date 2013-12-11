package Commands.DrawingAreaEventHandlingCommands;

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
public class DrawingAreaClickedCommand implements ICommand {

    private PresentationObjective scope;
    private MouseEvent eventArgs;

    @Override
    public Object execute() throws NotImplementedException
    {
        IDrawable objectUnderCursor = this.findObjetUnderCursor();


        return null;
    }

    private IDrawable findObjetUnderCursor()
    {
        Point mousePosition = this.eventArgs.getPoint();

        for(int i = 0; i < ((List<IDrawable>)(((Object[])this.scope.getScope())[1])).size(); i++)
        {
            IDrawable object = ((List<IDrawable>)(((Object[])this.scope.getScope())[1])).get(i);

            if(object.isPointInside(mousePosition))
            {
                //TODO detta ska ändras
                System.out.println("ILanguageObject Clicked, name: " + object.toString());
            }
        }

        return null;
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
