package Commands.DrawingAreaEventHandlingCommands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.ILanguageVariable;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;
import views.SetVariableValueDialog;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/9/13
 * Time: 7:56 AM
 * To change this template use File | Settings | File Templates.
 */
public class DrawingAreaVariableClickedCommand implements ICommand {

    ILanguageVariable clickedVariable;

    @Override
    public Object execute() throws NotImplementedException {
        System.out.println("Variable clicked" + this.clickedVariable.toString());

        new SetVariableValueDialog(this.clickedVariable);

        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        if(scopeObjects.size() != 1)
            throw new ScopeModificationNotSupported("Argument count missmatch");
        this.clickedVariable = (ILanguageVariable)scopeObjects.get(0);
    }
}
