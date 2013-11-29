package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;

public class HandleExitMenuCommand implements ICommand {

    @Override
	public Object execute() throws NotImplementedException
	{
		System.exit(0);

        return null;
	}

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        throw new ScopeModificationNotSupported("No scope needed in HandleExitMenuCommand");
    }

}
