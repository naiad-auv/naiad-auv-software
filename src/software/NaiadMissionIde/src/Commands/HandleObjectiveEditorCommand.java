package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import LanguageHandlers.Objective;
import Logging.ExceptionLogger;
import UserControls.EJDrawingArea;
import UserControls.EJTabbedPane;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.swing.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 2:42 PM
 * To change this template use File | Settings | File Templates.
 */
public class HandleObjectiveEditorCommand implements ICommand {

    private Objective objectiveToEdit;
    private EJTabbedPane base;

    public HandleObjectiveEditorCommand(EJTabbedPane base)
    {
        this.base = base;
    }

    @Override
    public Object execute() throws NotImplementedException
    {
        if(objectiveToEdit == null)
            throw new NotImplementedException();

        if(base.contains(objectiveToEdit))
        {
            base.setSelectedIndex(base.getIndexOf(objectiveToEdit));
        }
        else
        {
            base.addTab(objectiveToEdit.toString(), null, new EJDrawingArea(objectiveToEdit), null);
        }

        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported
    {
        if(scopeObjects.size() < 1)
            throw new ScopeModificationNotSupported("Not enough arguments in setScope");
        objectiveToEdit = (Objective)scopeObjects.get(0);
    }
}
