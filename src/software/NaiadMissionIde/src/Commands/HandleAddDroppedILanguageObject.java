package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Logging.ExceptionLogger;
import ViewModels.DrawingAreaViewModel;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/2/13
 * Time: 2:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class HandleAddDroppedILanguageObject implements ICommand{

    DrawingAreaViewModel scopeViewModel;
    ILanguageObject scopeObject;
    int x;
    int y;

    public HandleAddDroppedILanguageObject(DrawingAreaViewModel scopeViewModel)
    {
        this.scopeViewModel = scopeViewModel;
    }

    public Object execute() throws NotImplementedException {
        try
        {
            scopeViewModel.addItem(scopeObject, x, y);
        }
        catch(Exception e)
        {
            ExceptionLogger.Log(e);
        }
        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        if(scopeObjects.size() < 3)
            throw new ScopeModificationNotSupported("not enough arguments to add presentation object");
        this.scopeObject = (ILanguageObject)scopeObjects.get(0);
        this.x = (Integer)scopeObjects.get(1);
        this.y = (Integer)scopeObjects.get(2);

    }
}

